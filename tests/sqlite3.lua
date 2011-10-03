
local ffi = require 'ffi'
local sqlite = require 'extern.sqlite3'

local function opendb(filename)
  local out_db = ffi.new 'sqlite3*[1]'
  local result = sqlite.sqlite3_open(filename, out_db)
  local db = out_db[0]
  if (result == sqlite.SQLITE_OK) then
    return ffi.gc(db, sqlite.sqlite3_close)
  else
    sqlite.sqlite3_close(db)
    return nil, ffi.string(sqlite.sqlite3_errmsg(db))
  end
end

local function closedb(db)
  return sqlite.sqlite3_close(ffi.gc(db, nil))
end

local function preparestmt(db, sql)
  local out_stmt = ffi.new 'sqlite3_stmt*[1]'
  local result = sqlite.sqlite3_prepare_v2(db, sql, #sql, out_stmt, nil)
  local stmt = out_stmt[0]
  if (result == sqlite.SQLITE_OK) then
    return ffi.gc(stmt, sqlite.sqlite3_finalize)
  else
    sqlite.sqlite3_finalize(stmt)
    return nil, ffi.string(sqlite.sqlite3_errmsg(db))
  end
end

local function finalizestmt(stmt)
  return sqlite.sqlite3_finalize(ffi.gc(stmt, nil))
end

local function getcolumn(stmt, i)
  i = i - 1
  local t = sqlite.sqlite3_column_type(stmt, i)
  local name = ffi.string(sqlite.sqlite3_column_name(stmt, i))
  if (t == sqlite.SQLITE_NULL) then
    return name, nil
  elseif (t == sqlite.SQLITE_INTEGER) or (t == sqlite.SQLITE_FLOAT) then
    return name, sqlite.sqlite3_column_double(stmt, i)
  elseif (t == sqlite.SQLITE_TEXT) then
    local charptr = sqlite.sqlite3_column_text(stmt, i)
    return name, ffi.string(charptr, sqlite.sqlite3_column_bytes(stmt, i))
  elseif (t == sqlite.SQLITE_TEXT) or (t == sqlite.SQLITE_BLOB) then
    local byteptr = sqlite.sqlite3_column_blob(stmt, i)
    return name, ffi.string(byteptr, sqlite.sqlite3_column_bytes(stmt, i))
  else
    error('unknown column type')
  end
end

local SQLITE_STATIC = ffi.cast('sqlite3_destructor_type', 0)
local SQLITE_TRANSIENT = ffi.cast('sqlite3_destructor_type', -1)

local function bind(stmt, nameOrIndex, value, isBlob)
  local index = tonumber(nameOrIndex)
  if not index then
    index = sqlite.sqlite3_bind_parameter_index(stmt, nameOrIndex)
    if (index == 0) then
      error('unable to bind to: ' .. tostring(nameOrIndex))
    end
  end
  if type(value) == 'string' then
    if isBlob then
      sqlite.sqlite3_bind_blob(stmt, index, value, #value, SQLITE_TRANSIENT)
    else
      sqlite.sqlite3_bind_text(stmt, index, value, #value, SQLITE_TRANSIENT)
    end
  elseif (value == nil) then
    sqlite.sqlite3_bind_parameter_null(stmt, index)
  elseif (type(value) == 'boolean') then
    sqlite.sqlite3_bind_int(stmt, index, value and 1 or 0)
  elseif (type(value) == 'number') then
    sqlite.sqlite3_bind_double(stmt, index, value)
  else
    error('unsupported value type: ' .. type(value))
  end
end

local db = assert( opendb("mydb.sqlite") )

do
  local create_stmt = assert( preparestmt(db, [[
    
    CREATE TABLE IF NOT EXISTS people (
      name TEXT UNIQUE,
      age INTEGER,
      favourite_fruit TEXT
    );
    
  ]] ))

  assert(sqlite.sqlite3_step(create_stmt) == sqlite.SQLITE_DONE)

  finalizestmt(create_stmt)
end

do
  local insert_stmt = assert( preparestmt(db, [[
    
    INSERT OR REPLACE INTO people (name, age, favourite_fruit) VALUES (:name, :age, :fruit);
    
  ]] ))
  
  bind(insert_stmt, ':name', 'Bob')
  bind(insert_stmt, ':age', 32)
  bind(insert_stmt, ':fruit', 'Banana')
  assert(sqlite.sqlite3_step(insert_stmt) == sqlite.SQLITE_DONE)
  assert(sqlite.sqlite3_reset(insert_stmt) == sqlite.SQLITE_OK)
  
  bind(insert_stmt, ':name', 'Jane')
  bind(insert_stmt, ':age', 28)
  bind(insert_stmt, ':fruit', 'Kiwi')
  assert(sqlite.sqlite3_step(insert_stmt) == sqlite.SQLITE_DONE)
  assert(sqlite.sqlite3_reset(insert_stmt) == sqlite.SQLITE_OK)
  
  bind(insert_stmt, ':name', 'Andy')
  bind(insert_stmt, ':age', 30)
  bind(insert_stmt, ':fruit', 'Pineapple')
  assert(sqlite.sqlite3_step(insert_stmt) == sqlite.SQLITE_DONE)
  assert(sqlite.sqlite3_reset(insert_stmt) == sqlite.SQLITE_OK)
  
  bind(insert_stmt, ':name', 'Pat')
  bind(insert_stmt, ':age', 21)
  bind(insert_stmt, ':fruit', 'Banana')
  assert(sqlite.sqlite3_step(insert_stmt) == sqlite.SQLITE_DONE)
  assert(sqlite.sqlite3_reset(insert_stmt) == sqlite.SQLITE_OK)
  
  finalizestmt(insert_stmt)
end

do
  local select_stmt = assert(preparestmt(db, [[

    SELECT name, age, favourite_fruit FROM people ORDER BY name ASC;

  ]] ))

  while (sqlite.sqlite3_step(select_stmt) == sqlite.SQLITE_ROW) do
    local v = {}
    for i = 1, sqlite.sqlite3_column_count(select_stmt) do
      local name, value = getcolumn(select_stmt, i)
      v[i] = name .. ': ' .. tostring(value)
    end
    print(table.concat(v, ', '))
  end

  finalizestmt(select_stmt)
end

closedb(db)
