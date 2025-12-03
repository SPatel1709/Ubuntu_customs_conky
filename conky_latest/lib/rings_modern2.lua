-- rings_modern2.lua: Modern Conky with boxes and half-circle rings
require 'cairo'

-- Configuration for rounded rectangle boxes
local boxes = {
    -- Box 1: Weather box
    {
        x = 14,
        y = 340,
        width = 375,
        height = 170,
        radius = 15,
        bg_color = {0.10, 0.12, 0.14, 0.70},
        border_color = {0.30, 0.50, 0.65, 0.4},
        border_width = 2,
        shadow = true
    },
    -- Box 2: Network box
    {
        x = 14,
        y = 540,
        width = 310,
        height = 205,
        radius = 15,
        bg_color = {0.10, 0.12, 0.14, 0.70},
        border_color = {0.30, 0.50, 0.65, 0.4},
        border_width = 2,
        shadow = true
    },
    -- Box 3: System stats box (CPU, RAM, DISK rings)
    {
        x = 14,
        y = 775,
        width = 300,
        height = 100,
        radius = 15,
        bg_color = {0.10, 0.12, 0.14, 0.7},
        border_color = {0.30, 0.50, 0.65, 0.4},
        border_width = 2,
        shadow = true
    }
}

-- Ring configuration - half circles (bottom cut)
local system_rings = {
    {
        name = 'cpu',
        arg = 'cpu0',
        max = 100,
        x = 70, y = 825,
        radius = 35,
        thickness = 7,
        start_angle = 120,
        end_angle = 420,
        bg_color = 0xCCCCCC,
        bg_alpha = 0.3,
        fg_color = 0xFF6B9D,
        fg_alpha = 1.0,
        rounded = true
    },
    {
        name = 'memperc',
        arg = '',
        max = 100,
        x = 160, y = 825,
        radius = 35,
        thickness = 7,
        start_angle = 120,
        end_angle = 420,
        bg_color = 0xCCCCCC,
        bg_alpha = 0.3,
        fg_color = 0x6FBAEB,
        fg_alpha = 1.0,
        rounded = true
    },
    {
        name = 'fs_used_perc',
        arg = '/',
        max = 100,
        x = 250, y = 825,
        radius = 35,
        thickness = 7,
        start_angle = 120,
        end_angle = 420,
        bg_color = 0xCCCCCC,
        bg_alpha = 0.3,
        fg_color = 0xFFFFFF,
        fg_alpha = 1.0,
        rounded = true
    }
}

-- Converts hex color to normalized RGBA components
function rgb_to_r_g_b(colour, alpha)
    return ((colour / 0x10000) % 0x100) / 255.,
           ((colour / 0x100) % 0x100) / 255.,
           (colour % 0x100) / 255.,
           alpha
end

-- Draw a rounded rectangle
function draw_rounded_rectangle(cr, x, y, width, height, radius)
    local degrees = math.pi / 180.0
    
    cairo_new_sub_path(cr)
    cairo_arc(cr, x + width - radius, y + radius, radius, -90 * degrees, 0 * degrees)
    cairo_arc(cr, x + width - radius, y + height - radius, radius, 0 * degrees, 90 * degrees)
    cairo_arc(cr, x + radius, y + height - radius, radius, 90 * degrees, 180 * degrees)
    cairo_arc(cr, x + radius, y + radius, radius, 180 * degrees, 270 * degrees)
    cairo_close_path(cr)
end

-- Draw shadow effect
function draw_shadow(cr, x, y, width, height, radius)
    local shadow_offset = 3
    local shadow_blur = 5
    
    for i = shadow_blur, 1, -1 do
        local alpha = 0.05 * (shadow_blur - i + 1) / shadow_blur
        cairo_set_source_rgba(cr, 0, 0, 0, alpha)
        draw_rounded_rectangle(cr, x + shadow_offset, y + shadow_offset + i, width, height, radius)
        cairo_fill(cr)
    end
end

-- Draw all boxes
function draw_boxes(cr)
    for _, box in ipairs(boxes) do
        if box.shadow then
            draw_shadow(cr, box.x, box.y, box.width, box.height, box.radius)
        end
        
        draw_rounded_rectangle(cr, box.x, box.y, box.width, box.height, box.radius)
        cairo_set_source_rgba(cr, box.bg_color[1], box.bg_color[2], box.bg_color[3], box.bg_color[4])
        cairo_fill_preserve(cr)
        
        cairo_set_line_width(cr, box.border_width)
        cairo_set_source_rgba(cr, box.border_color[1], box.border_color[2], box.border_color[3], box.border_color[4])
        cairo_stroke(cr)
    end
end

-- Draws a single ring
function draw_system_ring(cr, ring, value)
    local angle_0 = (ring.start_angle or 0) * math.pi/180 - math.pi/2
    local angle_f = (ring.end_angle or 360) * math.pi/180 - math.pi/2
    local angle_v = angle_0 + (angle_f - angle_0) * (value / ring.max)

    cairo_set_line_width(cr, ring.thickness)
    cairo_set_line_cap(cr, ring.rounded and CAIRO_LINE_CAP_ROUND or CAIRO_LINE_CAP_BUTT)

    -- Draw background arc
    cairo_arc(cr, ring.x, ring.y, ring.radius, angle_0, angle_f)
    cairo_set_source_rgba(cr, rgb_to_r_g_b(ring.bg_color, ring.bg_alpha))
    cairo_stroke(cr)

    -- Draw foreground arc
    cairo_arc(cr, ring.x, ring.y, ring.radius, angle_0, angle_v)
    cairo_set_source_rgba(cr, rgb_to_r_g_b(ring.fg_color, ring.fg_alpha))
    cairo_stroke(cr)
end

-- Main function called by Conky
function conky_draw_widgets()
    if conky_window == nil then return end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable,
                                         conky_window.visual, conky_window.width, conky_window.height)
    local cr = cairo_create(cs)

    -- Draw boxes
    draw_boxes(cr)
    
    -- Draw rings
    for i, ring in ipairs(system_rings) do
        local val = tonumber(conky_parse('${' .. ring.name .. ' ' .. ring.arg .. '}')) or 0
        draw_system_ring(cr, ring, val)
    end

    cairo_destroy(cr)
    cairo_surface_destroy(cs)
end
