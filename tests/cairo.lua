
local cairo = require 'extern.cairo'

local surface = cairo.cairo_image_surface_create(cairo.CAIRO_FORMAT_ARGB32, 256, 256)
local cr = cairo.cairo_create(surface)

local xc, yc = 128, 128
local radius = 100
local angle1 = math.rad(45)
local angle2 = math.rad(180)

cairo.cairo_set_line_width(cr, 10)
cairo.cairo_arc(cr, xc, yc, radius, angle1, angle2)
cairo.cairo_stroke(cr)

-- draw helping lines
cairo.cairo_set_source_rgba(cr, 1, 0.2, 0.2, 0.6)
cairo.cairo_set_line_width(cr, 6)

cairo.cairo_arc(cr, xc, yc, 10, 0, 2*math.pi)
cairo.cairo_fill(cr)

cairo.cairo_arc(cr, xc, yc, radius, angle1, angle1)
cairo.cairo_line_to(cr, xc, yc)
cairo.cairo_arc(cr, xc, yc, radius, angle2, angle2)
cairo.cairo_line_to(cr, xc, yc)
cairo.cairo_stroke(cr)

cairo.cairo_surface_write_to_png(surface, "cairotest.png")
