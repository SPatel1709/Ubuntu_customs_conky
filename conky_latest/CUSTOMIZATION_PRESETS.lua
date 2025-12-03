-- CUSTOMIZATION PRESETS for rings_rounded_boxes.lua
-- Copy and paste these into your rings_rounded_boxes.lua to try different styles

-- ============================================================================
-- PRESET 1: GLASS MORPHISM (Modern transparent glass effect)
-- ============================================================================
--[[
local boxes = {
    {
        x = 0, y = 163, width = 300, height = 369, radius = 20,
        bg_color = {0.95, 0.95, 0.98, 0.15},      -- Almost white, very transparent
        border_color = {1.0, 1.0, 1.0, 0.6},       -- White border
        border_width = 1,
        shadow = true
    },
    {
        x = 5, y = 165, width = 138, height = 138, radius = 15,
        bg_color = {0.95, 0.95, 0.98, 0.2},
        border_color = {1.0, 1.0, 1.0, 0.7},
        border_width = 1,
        shadow = true
    }
}
]]

-- ============================================================================
-- PRESET 2: CYBERPUNK NEON (Bright neon borders with dark boxes)
-- ============================================================================
--[[
local boxes = {
    {
        x = 0, y = 163, width = 300, height = 369, radius = 5,
        bg_color = {0.05, 0.05, 0.15, 0.95},      -- Very dark blue
        border_color = {0.0, 1.0, 1.0, 1.0},       -- Cyan neon
        border_width = 2.5,
        shadow = false
    },
    {
        x = 5, y = 165, width = 138, height = 138, radius = 5,
        bg_color = {0.1, 0.05, 0.15, 0.95},
        border_color = {1.0, 0.0, 1.0, 1.0},       -- Magenta neon
        border_width = 2.5,
        shadow = false
    }
}
]]

-- ============================================================================
-- PRESET 3: MINIMALIST (Clean, no borders, subtle shadows)
-- ============================================================================
--[[
local boxes = {
    {
        x = 0, y = 163, width = 300, height = 369, radius = 18,
        bg_color = {0.15, 0.15, 0.15, 0.85},
        border_color = {0.0, 0.0, 0.0, 0.0},       -- No border
        border_width = 0,
        shadow = true
    },
    {
        x = 5, y = 165, width = 138, height = 138, radius = 12,
        bg_color = {0.18, 0.18, 0.18, 0.9},
        border_color = {0.0, 0.0, 0.0, 0.0},
        border_width = 0,
        shadow = true
    }
}
]]

-- ============================================================================
-- PRESET 4: GRADIENT GLOW (Purple to blue gradient effect)
-- ============================================================================
--[[
local boxes = {
    {
        x = 0, y = 163, width = 300, height = 369, radius = 15,
        bg_color = {0.1, 0.08, 0.2, 0.9},          -- Dark purple
        border_color = {0.5, 0.2, 0.8, 0.8},       -- Purple glow
        border_width = 3,
        shadow = true
    },
    {
        x = 5, y = 165, width = 138, height = 138, radius = 10,
        bg_color = {0.08, 0.15, 0.25, 0.9},        -- Dark blue
        border_color = {0.2, 0.5, 0.9, 0.8},       -- Blue glow
        border_width = 3,
        shadow = true
    }
}
]]

-- ============================================================================
-- PRESET 5: RETRO TERMINAL (Classic green terminal look)
-- ============================================================================
--[[
local boxes = {
    {
        x = 0, y = 163, width = 300, height = 369, radius = 8,
        bg_color = {0.0, 0.05, 0.0, 0.95},         -- Very dark green
        border_color = {0.0, 1.0, 0.0, 0.7},       -- Bright green
        border_width = 2,
        shadow = false
    },
    {
        x = 5, y = 165, width = 138, height = 138, radius = 5,
        bg_color = {0.0, 0.08, 0.0, 0.98},
        border_color = {0.0, 0.8, 0.0, 0.8},
        border_width = 2,
        shadow = false
    }
}
]]

-- ============================================================================
-- COLOR REFERENCE GUIDE
-- ============================================================================
--[[
RGBA Format: {Red, Green, Blue, Alpha}
All values are 0.0 to 1.0

Common Colors:
- Pure Red:     {1.0, 0.0, 0.0, 1.0}
- Pure Green:   {0.0, 1.0, 0.0, 1.0}
- Pure Blue:    {0.0, 0.0, 1.0, 1.0}
- White:        {1.0, 1.0, 1.0, 1.0}
- Black:        {0.0, 0.0, 0.0, 1.0}
- Gray:         {0.5, 0.5, 0.5, 1.0}

- Cyan:         {0.0, 1.0, 1.0, 1.0}
- Magenta:      {1.0, 0.0, 1.0, 1.0}
- Yellow:       {1.0, 1.0, 0.0, 1.0}

- Orange:       {1.0, 0.5, 0.0, 1.0}
- Pink:         {1.0, 0.4, 0.7, 1.0}
- Purple:       {0.6, 0.2, 0.8, 1.0}

Transparency:
- 1.0 = Fully opaque
- 0.8 = 80% opaque (20% transparent)
- 0.5 = 50% transparent
- 0.2 = 20% opaque (80% transparent)
- 0.0 = Fully transparent (invisible)

Converting Hex to RGBA:
Hex: #FF5733
- Red:   FF = 255 / 255 = 1.0
- Green: 57 = 87  / 255 = 0.34
- Blue:  33 = 51  / 255 = 0.20
Result: {1.0, 0.34, 0.20, 1.0}
]]

-- ============================================================================
-- INTERACTIVE ZONE CUSTOMIZATION
-- ============================================================================
--[[
To add more interactive zones, add entries to the interactive_zones table:

{
    x = 0,           -- Starting X coordinate
    y = 200,         -- Starting Y coordinate
    width = 150,     -- Zone width
    height = 50,     -- Zone height
    command = "gnome-system-monitor &",  -- Command to execute on click
    tooltip = "Click to open system monitor"  -- Description (not displayed yet)
}

Popular commands:
- "xdg-open 'https://google.com'" - Open URL in default browser
- "gnome-calculator &"             - Open calculator
- "gnome-system-monitor &"         - Open system monitor
- "playerctl next"                 - Next track
- "playerctl previous"             - Previous track
- "amixer set Master toggle"       - Mute/unmute sound
- "notify-send 'Title' 'Message'"  - Show notification
]]

-- ============================================================================
-- ADVANCED: CUSTOM DRAWING FUNCTIONS
-- ============================================================================
--[[
Want to add more shapes? You can define custom drawing functions:

-- Draw a circle
function draw_circle(cr, x, y, radius, color, alpha)
    cairo_set_source_rgba(cr, color[1], color[2], color[3], alpha)
    cairo_arc(cr, x, y, radius, 0, 2 * math.pi)
    cairo_fill(cr)
end

-- Draw a line
function draw_line(cr, x1, y1, x2, y2, color, width)
    cairo_set_source_rgba(cr, color[1], color[2], color[3], color[4])
    cairo_set_line_width(cr, width)
    cairo_move_to(cr, x1, y1)
    cairo_line_to(cr, x2, y2)
    cairo_stroke(cr)
end

Then call these in conky_draw_widgets() function!
]]
