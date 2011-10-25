
local ffi = require 'ffi'

-- SQLite3 extern
-- http://www.sqlite.org/c3ref/index_info.html

ffi.cdef [[

  typedef int64_t sqlite3_int64;
  typedef uint64_t sqlite3_uint64;
  
  typedef struct sqlite3 sqlite3;
  typedef struct sqlite3_backup sqlite3_backup;
  typedef struct sqlite3_vtab sqlite3_vtab;
  typedef struct sqlite3_vtab_cursor sqlite3_vtab_cursor;
  typedef struct sqlite3_index_info sqlite3_index_info;
  typedef struct sqlite3_blob sqlite3_blob;
  typedef struct sqlite3_module sqlite3_module;
  typedef struct sqlite3_value sqlite3_value;
  typedef struct sqlite3_context sqlite3_context;
  typedef void (*sqlite3_destructor_type)(void*);
  typedef struct sqlite3_index_info {
    /* Inputs */
    int nConstraint;           /* Number of entries in aConstraint */
    struct sqlite3_index_constraint {
       int iColumn;              /* Column on left-hand side of constraint */
       unsigned char op;         /* Constraint operator */
       unsigned char usable;     /* True if this constraint is usable */
       int iTermOffset;          /* Used internally - xBestIndex should ignore */
    } *aConstraint;            /* Table of WHERE clause constraints */
    int nOrderBy;              /* Number of terms in the ORDER BY clause */
    struct sqlite3_index_orderby {
       int iColumn;              /* Column number */
       unsigned char desc;       /* True for DESC.  False for ASC. */
    } *aOrderBy;               /* The ORDER BY clause */
    /* Outputs */
    struct sqlite3_index_constraint_usage {
      int argvIndex;           /* if >0, constraint is part of argv to xFilter */
      unsigned char omit;      /* Do not code a test for this constraint */
    } *aConstraintUsage;
    int idxNum;                /* Number used to identify the index */
    char *idxStr;              /* String, possibly obtained from sqlite3_malloc */
    int needToFreeIdxStr;      /* Free idxStr using sqlite3_free() if true */
    int orderByConsumed;       /* True if output is already ordered */
    double estimatedCost;      /* Estimated cost of using this index */
  };
  typedef struct sqlite3_file sqlite3_file;
  typedef struct sqlite3_io_methods {
    int iVersion;
    int (*xClose)(sqlite3_file*);
    int (*xRead)(sqlite3_file*, void*, int iAmt, sqlite3_int64 iOfst);
    int (*xWrite)(sqlite3_file*, const void*, int iAmt, sqlite3_int64 iOfst);
    int (*xTruncate)(sqlite3_file*, sqlite3_int64 size);
    int (*xSync)(sqlite3_file*, int flags);
    int (*xFileSize)(sqlite3_file*, sqlite3_int64 *pSize);
    int (*xLock)(sqlite3_file*, int);
    int (*xUnlock)(sqlite3_file*, int);
    int (*xCheckReservedLock)(sqlite3_file*, int *pResOut);
    int (*xFileControl)(sqlite3_file*, int op, void *pArg);
    int (*xSectorSize)(sqlite3_file*);
    int (*xDeviceCharacteristics)(sqlite3_file*);
    /* Methods above are valid for version 1 */
    int (*xShmMap)(sqlite3_file*, int iPg, int pgsz, int, void volatile**);
    int (*xShmLock)(sqlite3_file*, int offset, int n, int flags);
    void (*xShmBarrier)(sqlite3_file*);
    int (*xShmUnmap)(sqlite3_file*, int deleteFlag);
    /* Methods above are valid for version 2 */
    /* Additional methods may be added in future releases */
  } sqlite3_io_methods;
  typedef struct sqlite3_file {
    const struct sqlite3_io_methods *pMethods;  /* Methods for an open file */
  } sqlite3_file;
  typedef struct sqlite3_mem_methods sqlite3_mem_methods;
  struct sqlite3_mem_methods {
    void *(*xMalloc)(int);         /* Memory allocation function */
    void (*xFree)(void*);          /* Free a prior allocation */
    void *(*xRealloc)(void*,int);  /* Resize an allocation */
    int (*xSize)(void*);           /* Return the size of an allocation */
    int (*xRoundup)(int);          /* Round up request size to allocation size */
    int (*xInit)(void*);           /* Initialize the memory allocator */
    void (*xShutdown)(void*);      /* Deinitialize the memory allocator */
    void *pAppData;                /* Argument to xInit() and xShutdown() */
  };  
  struct sqlite3_module {
    int iVersion;
    int (*xCreate)(sqlite3*, void *pAux,
                 int argc, const char *const*argv,
                 sqlite3_vtab **ppVTab, char**);
    int (*xConnect)(sqlite3*, void *pAux,
                 int argc, const char *const*argv,
                 sqlite3_vtab **ppVTab, char**);
    int (*xBestIndex)(sqlite3_vtab *pVTab, sqlite3_index_info*);
    int (*xDisconnect)(sqlite3_vtab *pVTab);
    int (*xDestroy)(sqlite3_vtab *pVTab);
    int (*xOpen)(sqlite3_vtab *pVTab, sqlite3_vtab_cursor **ppCursor);
    int (*xClose)(sqlite3_vtab_cursor*);
    int (*xFilter)(sqlite3_vtab_cursor*, int idxNum, const char *idxStr,
                  int argc, sqlite3_value **argv);
    int (*xNext)(sqlite3_vtab_cursor*);
    int (*xEof)(sqlite3_vtab_cursor*);
    int (*xColumn)(sqlite3_vtab_cursor*, sqlite3_context*, int);
    int (*xRowid)(sqlite3_vtab_cursor*, sqlite3_int64 *pRowid);
    int (*xUpdate)(sqlite3_vtab *, int, sqlite3_value **, sqlite3_int64 *);
    int (*xBegin)(sqlite3_vtab *pVTab);
    int (*xSync)(sqlite3_vtab *pVTab);
    int (*xCommit)(sqlite3_vtab *pVTab);
    int (*xRollback)(sqlite3_vtab *pVTab);
    int (*xFindFunction)(sqlite3_vtab *pVtab, int nArg, const char *zName,
                         void (**pxFunc)(sqlite3_context*,int,sqlite3_value**),
                         void **ppArg);
    int (*xRename)(sqlite3_vtab *pVtab, const char *zNew);
    /* The methods above are in version 1 of the sqlite_module object. Those 
    ** below are for version 2 and greater. */
    int (*xSavepoint)(sqlite3_vtab *pVTab, int);
    int (*xRelease)(sqlite3_vtab *pVTab, int);
    int (*xRollbackTo)(sqlite3_vtab *pVTab, int);
  };  
  typedef struct sqlite3_mutex sqlite3_mutex;
  typedef struct sqlite3_mutex_methods sqlite3_mutex_methods;
  struct sqlite3_mutex_methods {
    int (*xMutexInit)(void);
    int (*xMutexEnd)(void);
    sqlite3_mutex *(*xMutexAlloc)(int);
    void (*xMutexFree)(sqlite3_mutex *);
    void (*xMutexEnter)(sqlite3_mutex *);
    int (*xMutexTry)(sqlite3_mutex *);
    void (*xMutexLeave)(sqlite3_mutex *);
    int (*xMutexHeld)(sqlite3_mutex *);
    int (*xMutexNotheld)(sqlite3_mutex *);
  };
  typedef struct sqlite3_pcache sqlite3_pcache;  
  typedef struct sqlite3_pcache_methods sqlite3_pcache_methods;
  struct sqlite3_pcache_methods {
    void *pArg;
    int (*xInit)(void*);
    void (*xShutdown)(void*);
    sqlite3_pcache *(*xCreate)(int szPage, int bPurgeable);
    void (*xCachesize)(sqlite3_pcache*, int nCachesize);
    int (*xPagecount)(sqlite3_pcache*);
    void *(*xFetch)(sqlite3_pcache*, unsigned key, int createFlag);
    void (*xUnpin)(sqlite3_pcache*, void*, int discard);
    void (*xRekey)(sqlite3_pcache*, void*, unsigned oldKey, unsigned newKey);
    void (*xTruncate)(sqlite3_pcache*, unsigned iLimit);
    void (*xDestroy)(sqlite3_pcache*);
  };
  typedef struct sqlite3_stmt sqlite3_stmt;
  //SQLITE_EXTERN char *sqlite3_temp_directory;
  typedef struct Mem sqlite3_value;
  typedef struct sqlite3_vfs sqlite3_vfs;
  typedef void (*sqlite3_syscall_ptr)(void);
  struct sqlite3_vfs {
    int iVersion;            /* Structure version number (currently 3) */
    int szOsFile;            /* Size of subclassed sqlite3_file */
    int mxPathname;          /* Maximum file pathname length */
    sqlite3_vfs *pNext;      /* Next registered VFS */
    const char *zName;       /* Name of this virtual file system */
    void *pAppData;          /* Pointer to application-specific data */
    int (*xOpen)(sqlite3_vfs*, const char *zName, sqlite3_file*,
                 int flags, int *pOutFlags);
    int (*xDelete)(sqlite3_vfs*, const char *zName, int syncDir);
    int (*xAccess)(sqlite3_vfs*, const char *zName, int flags, int *pResOut);
    int (*xFullPathname)(sqlite3_vfs*, const char *zName, int nOut, char *zOut);
    void *(*xDlOpen)(sqlite3_vfs*, const char *zFilename);
    void (*xDlError)(sqlite3_vfs*, int nByte, char *zErrMsg);
    void (*(*xDlSym)(sqlite3_vfs*,void*, const char *zSymbol))(void);
    void (*xDlClose)(sqlite3_vfs*, void*);
    int (*xRandomness)(sqlite3_vfs*, int nByte, char *zOut);
    int (*xSleep)(sqlite3_vfs*, int microseconds);
    int (*xCurrentTime)(sqlite3_vfs*, double*);
    int (*xGetLastError)(sqlite3_vfs*, int, char *);
    /*
    ** The methods above are in version 1 of the sqlite_vfs object
    ** definition.  Those that follow are added in version 2 or later
    */
    int (*xCurrentTimeInt64)(sqlite3_vfs*, sqlite3_int64*);
    /*
    ** The methods above are in versions 1 and 2 of the sqlite_vfs object.
    ** Those below are for version 3 and greater.
    */
    int (*xSetSystemCall)(sqlite3_vfs*, const char *zName, sqlite3_syscall_ptr);
    sqlite3_syscall_ptr (*xGetSystemCall)(sqlite3_vfs*, const char *zName);
    const char *(*xNextSystemCall)(sqlite3_vfs*, const char *zName);
    /*
    ** The methods above are in versions 1 through 3 of the sqlite_vfs object.
    ** New fields may be appended in figure versions.  The iVersion
    ** value will increment whenever this happens. 
    */
  };
  struct sqlite3_vtab {
    const sqlite3_module *pModule;  /* The module for this virtual table */
    int nRef;                       /* NO LONGER USED */
    char *zErrMsg;                  /* Error message from sqlite3_mprintf() */
    /* Virtual table implementations will typically add additional fields */
  };
  struct sqlite3_vtab_cursor {
    sqlite3_vtab *pVtab;      /* Virtual table of this cursor */
    /* Virtual table implementations will typically add additional fields */
  };
  enum {
    SQLITE_INTEGER = 1,
    SQLITE_FLOAT = 2,
    SQLITE_TEXT = 3,
    SQLITE3_TEXT = 3,
    SQLITE_BLOB = 4,
    SQLITE_NULL = 5
  };
  enum {
    SQLITE_OK = 0,   /* Successful result */
    SQLITE_ERROR = 1,   /* SQL error or missing database */
    SQLITE_INTERNAL = 2,   /* Internal logic error in SQLite */
    SQLITE_PERM = 3,   /* Access permission denied */
    SQLITE_ABORT = 4,   /* Callback routine requested an abort */
    SQLITE_BUSY = 5,   /* The database file is locked */
    SQLITE_LOCKED = 6,   /* A table in the database is locked */
    SQLITE_NOMEM = 7,   /* A malloc() failed */
    SQLITE_READONLY = 8,   /* Attempt to write a readonly database */
    SQLITE_INTERRUPT = 9,   /* Operation terminated by sqlite3_interrupt()*/
    SQLITE_IOERR = 10,   /* Some kind of disk I/O error occurred */
    SQLITE_CORRUPT = 11,   /* The database disk image is malformed */
    SQLITE_NOTFOUND = 12,   /* Unknown opcode in sqlite3_file_control() */
    SQLITE_FULL = 13,   /* Insertion failed because database is full */
    SQLITE_CANTOPEN = 14,   /* Unable to open the database file */
    SQLITE_PROTOCOL = 15,   /* Database lock protocol error */
    SQLITE_EMPTY = 16,   /* Database is empty */
    SQLITE_SCHEMA = 17,   /* The database schema changed */
    SQLITE_TOOBIG = 18,   /* String or BLOB exceeds size limit */
    SQLITE_CONSTRAINT = 19,   /* Abort due to constraint violation */
    SQLITE_MISMATCH = 20,   /* Data type mismatch */
    SQLITE_MISUSE = 21,   /* Library used incorrectly */
    SQLITE_NOLFS = 22,   /* Uses OS features not supported on host */
    SQLITE_AUTH = 23,   /* Authorization denied */
    SQLITE_FORMAT = 24,   /* Auxiliary database format error */
    SQLITE_RANGE = 25,   /* 2nd parameter to sqlite3_bind out of range */
    SQLITE_NOTADB = 26,   /* File opened that is not a database file */
    SQLITE_ROW = 100,  /* sqlite3_step() has another row ready */
    SQLITE_DONE = 101  /* sqlite3_step() has finished executing */
  };
  
  // methods
  void *sqlite3_aggregate_context(sqlite3_context*, int nBytes);
  int sqlite3_auto_extension(void (*xEntryPoint)(void));
  sqlite3_backup *sqlite3_backup_init(
    sqlite3 *pDest,                        /* Destination database handle */
    const char *zDestName,                 /* Destination database name */
    sqlite3 *pSource,                      /* Source database handle */
    const char *zSourceName                /* Source database name */
  );
  int sqlite3_backup_step(sqlite3_backup *p, int nPage);
  int sqlite3_backup_finish(sqlite3_backup *p);
  int sqlite3_backup_remaining(sqlite3_backup *p);
  int sqlite3_backup_pagecount(sqlite3_backup *p);  
  int sqlite3_bind_blob(sqlite3_stmt*, int, const void*, int n, void(*)(void*));
  int sqlite3_bind_double(sqlite3_stmt*, int, double);
  int sqlite3_bind_int(sqlite3_stmt*, int, int);
  int sqlite3_bind_int64(sqlite3_stmt*, int, sqlite3_int64);
  int sqlite3_bind_null(sqlite3_stmt*, int);
  int sqlite3_bind_parameter_count(sqlite3_stmt*);
  int sqlite3_bind_parameter_index(sqlite3_stmt*, const char *zName);
  const char *sqlite3_bind_parameter_name(sqlite3_stmt*, int);
  int sqlite3_bind_text(sqlite3_stmt*, int, const char*, int n, void(*)(void*));
  int sqlite3_bind_text16(sqlite3_stmt*, int, const void*, int, void(*)(void*));
  int sqlite3_bind_value(sqlite3_stmt*, int, const sqlite3_value*);
  int sqlite3_bind_zeroblob(sqlite3_stmt*, int, int n);  
  int sqlite3_blob_bytes(sqlite3_blob *);
  int sqlite3_blob_close(sqlite3_blob *);
  int sqlite3_blob_open(
    sqlite3*,
    const char *zDb,
    const char *zTable,
    const char *zColumn,
    sqlite3_int64 iRow,
    int flags,
    sqlite3_blob **ppBlob
  );
  int sqlite3_blob_read(sqlite3_blob *, void *Z, int N, int iOffset);
  int sqlite3_blob_reopen(sqlite3_blob *, sqlite3_int64);
  int sqlite3_blob_write(sqlite3_blob *, const void *z, int n, int iOffset);
  int sqlite3_busy_handler(sqlite3*, int(*)(void*,int), void*);
  int sqlite3_busy_timeout(sqlite3*, int ms);
  int sqlite3_changes(sqlite3*);
  int sqlite3_clear_bindings(sqlite3_stmt*);
  int sqlite3_close(sqlite3 *);
  int sqlite3_collation_needed(
    sqlite3*, 
    void*, 
    void(*)(void*,sqlite3*,int eTextRep,const char*)
  );
  int sqlite3_collation_needed16(
    sqlite3*, 
    void*,
    void(*)(void*,sqlite3*,int eTextRep,const void*)
  );
  int sqlite3_collation_needed(
    sqlite3*, 
    void*, 
    void(*)(void*,sqlite3*,int eTextRep,const char*)
  );
  int sqlite3_collation_needed16(
    sqlite3*, 
    void*,
    void(*)(void*,sqlite3*,int eTextRep,const void*)
  );
  const void *sqlite3_column_blob(sqlite3_stmt*, int iCol);
  int sqlite3_column_bytes(sqlite3_stmt*, int iCol);
  int sqlite3_column_bytes16(sqlite3_stmt*, int iCol);
  int sqlite3_column_count(sqlite3_stmt *pStmt);
  const char *sqlite3_column_database_name(sqlite3_stmt*,int);
  const void *sqlite3_column_database_name16(sqlite3_stmt*,int);
  const char *sqlite3_column_decltype(sqlite3_stmt*,int);
  const void *sqlite3_column_decltype16(sqlite3_stmt*,int);
  double sqlite3_column_double(sqlite3_stmt*, int iCol);
  int sqlite3_column_int(sqlite3_stmt*, int iCol);
  sqlite3_int64 sqlite3_column_int64(sqlite3_stmt*, int iCol);
  const char *sqlite3_column_name(sqlite3_stmt*, int N);
  const void *sqlite3_column_name16(sqlite3_stmt*, int N);
  const char *sqlite3_column_origin_name(sqlite3_stmt*,int);
  const void *sqlite3_column_origin_name16(sqlite3_stmt*,int);  
  const char *sqlite3_column_table_name(sqlite3_stmt*,int);
  const void *sqlite3_column_table_name16(sqlite3_stmt*,int);
  const unsigned char *sqlite3_column_text(sqlite3_stmt*, int iCol);
  const void *sqlite3_column_text16(sqlite3_stmt*, int iCol);
  int sqlite3_column_type(sqlite3_stmt*, int iCol);
  sqlite3_value *sqlite3_column_value(sqlite3_stmt*, int iCol);
  void *sqlite3_commit_hook(sqlite3*, int(*)(void*), void*);
  //#ifndef SQLITE_OMIT_COMPILEOPTION_DIAGS
  const char *sqlite3_compileoption_get(int N);
  int sqlite3_compileoption_used(const char *zOptName);
  //#endif
  int sqlite3_complete(const char *sql);
  int sqlite3_complete16(const void *sql);
  int sqlite3_config(int, ...);
  sqlite3 *sqlite3_context_db_handle(sqlite3_context*);
  int sqlite3_create_collation(
    sqlite3*, 
    const char *zName, 
    int eTextRep, 
    void *pArg,
    int(*xCompare)(void*,int,const void*,int,const void*)
  );
  int sqlite3_create_collation_v2(
    sqlite3*, 
    const char *zName, 
    int eTextRep, 
    void *pArg,
    int(*xCompare)(void*,int,const void*,int,const void*),
    void(*xDestroy)(void*)
  );
  int sqlite3_create_collation16(
    sqlite3*, 
    const void *zName,
    int eTextRep, 
    void *pArg,
    int(*xCompare)(void*,int,const void*,int,const void*)
  );
  int sqlite3_create_function(
    sqlite3 *db,
    const char *zFunctionName,
    int nArg,
    int eTextRep,
    void *pApp,
    void (*xFunc)(sqlite3_context*,int,sqlite3_value**),
    void (*xStep)(sqlite3_context*,int,sqlite3_value**),
    void (*xFinal)(sqlite3_context*)
  );
  int sqlite3_create_function16(
    sqlite3 *db,
    const void *zFunctionName,
    int nArg,
    int eTextRep,
    void *pApp,
    void (*xFunc)(sqlite3_context*,int,sqlite3_value**),
    void (*xStep)(sqlite3_context*,int,sqlite3_value**),
    void (*xFinal)(sqlite3_context*)
  );
  int sqlite3_create_function_v2(
    sqlite3 *db,
    const char *zFunctionName,
    int nArg,
    int eTextRep,
    void *pApp,
    void (*xFunc)(sqlite3_context*,int,sqlite3_value**),
    void (*xStep)(sqlite3_context*,int,sqlite3_value**),
    void (*xFinal)(sqlite3_context*),
    void(*xDestroy)(void*)
  );
  int sqlite3_create_module(
    sqlite3 *db,               /* SQLite connection to register module with */
    const char *zName,         /* Name of the module */
    const sqlite3_module *p,   /* Methods for the module */
    void *pClientData          /* Client data for xCreate/xConnect */
  );
  int sqlite3_create_module_v2(
    sqlite3 *db,               /* SQLite connection to register module with */
    const char *zName,         /* Name of the module */
    const sqlite3_module *p,   /* Methods for the module */
    void *pClientData,         /* Client data for xCreate/xConnect */
    void(*xDestroy)(void*)     /* Module destructor function */
  );
  int sqlite3_data_count(sqlite3_stmt *pStmt);
  int sqlite3_db_config(sqlite3*, int op, ...);
  sqlite3 *sqlite3_db_handle(sqlite3_stmt*);
  sqlite3_mutex *sqlite3_db_mutex(sqlite3*);
  int sqlite3_db_status(sqlite3*, int op, int *pCur, int *pHiwtr, int resetFlg);
  int sqlite3_declare_vtab(sqlite3*, const char *zSQL);
  int sqlite3_enable_load_extension(sqlite3 *db, int onoff);
  int sqlite3_enable_shared_cache(int);
  int sqlite3_errcode(sqlite3 *db);
  const char *sqlite3_errmsg(sqlite3*);
  const void *sqlite3_errmsg16(sqlite3*);
  int sqlite3_exec(
    sqlite3*,                                  /* An open database */
    const char *sql,                           /* SQL to be evaluated */
    int (*callback)(void*,int,char**,char**),  /* Callback function */
    void *,                                    /* 1st argument to callback */
    char **errmsg                              /* Error msg written here */
  );
  int sqlite3_extended_errcode(sqlite3 *db);
  int sqlite3_extended_result_codes(sqlite3*, int onoff);
  int sqlite3_file_control(sqlite3*, const char *zDbName, int op, void*);
  int sqlite3_finalize(sqlite3_stmt *pStmt);
  void sqlite3_free(void*);
  int sqlite3_get_table(
    sqlite3 *db,          /* An open database */
    const char *zSql,     /* SQL to be evaluated */
    char ***pazResult,    /* Results of the query */
    int *pnRow,           /* Number of result rows written here */
    int *pnColumn,        /* Number of result columns written here */
    char **pzErrmsg       /* Error msg written here */
  );
  void sqlite3_free_table(char **result);
  int sqlite3_get_autocommit(sqlite3*);
  void *sqlite3_get_auxdata(sqlite3_context*, int N);
  int sqlite3_initialize(void);
  void sqlite3_interrupt(sqlite3*);
  sqlite3_int64 sqlite3_last_insert_rowid(sqlite3*);
  const char *sqlite3_libversion(void);
  int sqlite3_libversion_number(void);
  int sqlite3_limit(sqlite3*, int id, int newVal);
  int sqlite3_load_extension(
    sqlite3 *db,          /* Load the extension into this database connection */
    const char *zFile,    /* Name of the shared library containing extension */
    const char *zProc,    /* Entry point.  Derived from zFile if 0 */
    char **pzErrMsg       /* Put error message here if not 0 */
  );
  void sqlite3_log(int iErrCode, const char *zFormat, ...);
  void *sqlite3_malloc(int);
  sqlite3_int64 sqlite3_memory_highwater(int resetFlag);
  sqlite3_int64 sqlite3_memory_used(void);
  char *sqlite3_mprintf(const char*,...);
  sqlite3_mutex *sqlite3_mutex_alloc(int);
  void sqlite3_mutex_enter(sqlite3_mutex*);
  void sqlite3_mutex_free(sqlite3_mutex*);
  int sqlite3_mutex_try(sqlite3_mutex*);
  sqlite3_stmt *sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt);
  int sqlite3_open(
    const char *filename,   /* Database filename (UTF-8) */
    sqlite3 **ppDb          /* OUT: SQLite db handle */
  );
  int sqlite3_open16(
    const void *filename,   /* Database filename (UTF-16) */
    sqlite3 **ppDb          /* OUT: SQLite db handle */
  );
  int sqlite3_open_v2(
    const char *filename,   /* Database filename (UTF-8) */
    sqlite3 **ppDb,         /* OUT: SQLite db handle */
    int flags,              /* Flags */
    const char *zVfs        /* Name of VFS module to use */
  );
  int sqlite3_overload_function(sqlite3*, const char *zFuncName, int nArg);
  int sqlite3_prepare(
    sqlite3 *db,            /* Database handle */
    const char *zSql,       /* SQL statement, UTF-8 encoded */
    int nByte,              /* Maximum length of zSql in bytes. */
    sqlite3_stmt **ppStmt,  /* OUT: Statement handle */
    const char **pzTail     /* OUT: Pointer to unused portion of zSql */
  );
  int sqlite3_prepare_v2(
    sqlite3 *db,            /* Database handle */
    const char *zSql,       /* SQL statement, UTF-8 encoded */
    int nByte,              /* Maximum length of zSql in bytes. */
    sqlite3_stmt **ppStmt,  /* OUT: Statement handle */
    const char **pzTail     /* OUT: Pointer to unused portion of zSql */
  );
  int sqlite3_prepare16(
    sqlite3 *db,            /* Database handle */
    const void *zSql,       /* SQL statement, UTF-16 encoded */
    int nByte,              /* Maximum length of zSql in bytes. */
    sqlite3_stmt **ppStmt,  /* OUT: Statement handle */
    const void **pzTail     /* OUT: Pointer to unused portion of zSql */
  );
  int sqlite3_prepare16_v2(
    sqlite3 *db,            /* Database handle */
    const void *zSql,       /* SQL statement, UTF-16 encoded */
    int nByte,              /* Maximum length of zSql in bytes. */
    sqlite3_stmt **ppStmt,  /* OUT: Statement handle */
    const void **pzTail     /* OUT: Pointer to unused portion of zSql */
  );
  void *sqlite3_profile(sqlite3*,
     void(*xProfile)(void*,const char*,sqlite3_uint64), void*);
  void sqlite3_progress_handler(sqlite3*, int, int(*)(void*), void*);
  void sqlite3_randomness(int N, void *P);
  void *sqlite3_realloc(void*, int);
  int sqlite3_release_memory(int);
  int sqlite3_reset(sqlite3_stmt *pStmt);
  void sqlite3_reset_auto_extension(void);
  void sqlite3_result_blob(sqlite3_context*, const void*, int, void(*)(void*));
  void sqlite3_result_double(sqlite3_context*, double);
  void sqlite3_result_error(sqlite3_context*, const char*, int);
  void sqlite3_result_error16(sqlite3_context*, const void*, int);
  void sqlite3_result_error_toobig(sqlite3_context*);
  void sqlite3_result_error_nomem(sqlite3_context*);
  void sqlite3_result_error_code(sqlite3_context*, int);
  void sqlite3_result_int(sqlite3_context*, int);
  void sqlite3_result_int64(sqlite3_context*, sqlite3_int64);
  void sqlite3_result_null(sqlite3_context*);
  void sqlite3_result_text(sqlite3_context*, const char*, int, void(*)(void*));
  void sqlite3_result_text16(sqlite3_context*, const void*, int, void(*)(void*));
  void sqlite3_result_text16le(sqlite3_context*, const void*, int,void(*)(void*));
  void sqlite3_result_text16be(sqlite3_context*, const void*, int,void(*)(void*));
  void sqlite3_result_value(sqlite3_context*, sqlite3_value*);
  void sqlite3_result_zeroblob(sqlite3_context*, int n);
  void *sqlite3_rollback_hook(sqlite3*, void(*)(void *), void*);
  int sqlite3_set_authorizer(
    sqlite3*,
    int (*xAuth)(void*,int,const char*,const char*,const char*,const char*),
    void *pUserData
  );
  void sqlite3_set_auxdata(sqlite3_context*, int N, void*, void (*)(void*));
  int sqlite3_shutdown(void);
  int sqlite3_sleep(int);
  char *sqlite3_snprintf(int,char*,const char*, ...);
  sqlite3_int64 sqlite3_soft_heap_limit64(sqlite3_int64 N);
  const char *sqlite3_sourceid(void);
  const char *sqlite3_sql(sqlite3_stmt *pStmt);
  int sqlite3_status(int op, int *pCurrent, int *pHighwater, int resetFlag);
  int sqlite3_step(sqlite3_stmt*);
  int sqlite3_stmt_readonly(sqlite3_stmt *pStmt);
  int sqlite3_stmt_status(sqlite3_stmt*, int op,int resetFlg);
  int sqlite3_strnicmp(const char *, const char *, int);
  int sqlite3_table_column_metadata(
    sqlite3 *db,                /* Connection handle */
    const char *zDbName,        /* Database name or NULL */
    const char *zTableName,     /* Table name */
    const char *zColumnName,    /* Column name */
    char const **pzDataType,    /* OUTPUT: Declared data type */
    char const **pzCollSeq,     /* OUTPUT: Collation sequence name */
    int *pNotNull,              /* OUTPUT: True if NOT NULL constraint exists */
    int *pPrimaryKey,           /* OUTPUT: True if column part of PK */
    int *pAutoinc               /* OUTPUT: True if column is auto-increment */
  );
  int sqlite3_test_control(int op, ...);
  int sqlite3_threadsafe(void);
  int sqlite3_total_changes(sqlite3*);
  void *sqlite3_trace(sqlite3*, void(*xTrace)(void*,const char*), void*);
  int sqlite3_unlock_notify(
    sqlite3 *pBlocked,                          /* Waiting connection */
    void (*xNotify)(void **apArg, int nArg),    /* Callback function to invoke */
    void *pNotifyArg                            /* Argument to pass to xNotify */
  );
  void *sqlite3_update_hook(
    sqlite3*, 
    void(*)(void *,int ,char const *,char const *,sqlite3_int64),
    void*
  );
  const char *sqlite3_uri_parameter(const char *zFilename, const char *zParam);
  void *sqlite3_user_data(sqlite3_context*);
  const void *sqlite3_value_blob(sqlite3_value*);
  int sqlite3_value_bytes(sqlite3_value*);
  int sqlite3_value_bytes16(sqlite3_value*);
  double sqlite3_value_double(sqlite3_value*);
  int sqlite3_value_int(sqlite3_value*);
  sqlite3_int64 sqlite3_value_int64(sqlite3_value*);
  const unsigned char *sqlite3_value_text(sqlite3_value*);
  const void *sqlite3_value_text16(sqlite3_value*);
  const void *sqlite3_value_text16le(sqlite3_value*);
  const void *sqlite3_value_text16be(sqlite3_value*);
  int sqlite3_value_type(sqlite3_value*);
  int sqlite3_value_numeric_type(sqlite3_value*);
  sqlite3_vfs *sqlite3_vfs_find(const char *zVfsName);
  int sqlite3_vfs_register(sqlite3_vfs*, int makeDflt);
  int sqlite3_vfs_unregister(sqlite3_vfs*);
  char *sqlite3_vmprintf(const char*, va_list);
  char *sqlite3_vsnprintf(int,char*,const char*, va_list);
  int sqlite3_vtab_config(sqlite3*, int op, ...);
  int sqlite3_vtab_on_conflict(sqlite3 *);
  int sqlite3_wal_autocheckpoint(sqlite3 *db, int N);
  int sqlite3_wal_checkpoint(sqlite3 *db, const char *zDb);
  int sqlite3_wal_checkpoint_v2(
    sqlite3 *db,                    /* Database handle */
    const char *zDb,                /* Name of attached database (or NULL) */
    int eMode,                      /* SQLITE_CHECKPOINT_* value */
    int *pnLog,                     /* OUT: Size of WAL log in frames */
    int *pnCkpt                     /* OUT: Total number of frames checkpointed */
  );
  void *sqlite3_wal_hook(
    sqlite3*, 
    int(*)(void *,sqlite3*,const char*,int),
    void*
  );

]]

local SQLITE_STATIC = ffi.cast('sqlite3_destructor_type', 0)
local SQLITE_TRANSIENT = ffi.cast('sqlite3_destructor_type', -1)

return ffi.load 'sqlite3'
