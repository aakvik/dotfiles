--[[
     Steamburn Awesome WM theme 3.0
     github.com/copycat-killer

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local os    = { getenv = os.getenv }

local theme                                     = {}
theme.zenburn_dir                               = require("awful.util").get_themes_dir() .. "zenburn"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/steamburn"
-- theme.wallpaper                                 = "#e2ccb0"
theme.font                                      = "Misc Tamsyn 12"
theme.fg_normal                                 = "#e2ccb0"
theme.fg_focus                                  = "#e2ccb0"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#140c0b"
theme.bg_focus                                  = "#140c0b"
theme.bg_urgent                                 = "#2a1f1e"
theme.border_width                              = 1
theme.border_normal                             = "#e2ccb0"
theme.border_focus                              = "#e2ccb0"
theme.border_marked                             = "#CC9393"
theme.taglist_fg_focus                          = "#e2ccb0"
theme.tasklist_bg_focus                         = "#140c0b"
theme.tasklist_fg_focus                         = "#e2ccb0"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.menu_height                               = 16
theme.menu_width                                = 250
theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.layout_txt_tile                           = "[t]"
theme.layout_txt_tileleft                       = "[l]"
theme.layout_txt_tilebottom                     = "[b]"
theme.layout_txt_tiletop                        = "[tt]"
theme.layout_txt_fairv                          = "[fv]"
theme.layout_txt_fairh                          = "[fh]"
theme.layout_txt_spiral                         = "[s]"
theme.layout_txt_dwindle                        = "[d]"
theme.layout_txt_max                            = "[m]"
theme.layout_txt_fullscreen                     = "[F]"
theme.layout_txt_magnifier                      = "[M]"
theme.layout_txt_floating                       = "[|]"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 3
theme.titlebar_close_button_normal              = theme.zenburn_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.zenburn_dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.zenburn_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.zenburn_dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.zenburn_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.zenburn_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.zenburn_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.zenburn_dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.zenburn_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.zenburn_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.zenburn_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.zenburn_dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.zenburn_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.zenburn_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.zenburn_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.zenburn_dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.zenburn_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.zenburn_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.zenburn_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.zenburn_dir.."/titlebar/maximized_focus_active.png"

-- lain related
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

local markup = lain.util.markup
local gray   = "#94928F"

-- Textclock
local mytextclock = wibox.widget.textclock(" %a %b %d %H:%M ")
mytextclock.font = theme.font

-- CPU
local cpu = lain.widget.sysload({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(gray, " Cpu ") .. load_1 .. " "))
    end
})

-- MEM
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(gray, " Mem ") .. mem_now.used .. " "))
    end
})

-- Battery
local bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc
        if bat_now.ac_status == 1 then perc = "Plug" end
        widget:set_markup(markup.font(theme.font, markup(gray, " Bat ") .. perc .. " "))
    end
})

-- Net checker
local net = lain.widget.net({
    settings = function()
        if net_now.state == "up" then net_state = "On"
        else net_state = "Off" end
        widget:set_markup(markup.font(theme.font, markup(gray, " Net ") .. net_state .. " "))
    end
})

-- ALSA volume
theme.volume = lain.widget.alsa({
    settings = function()
        header = " Vol "
        vlevel  = volume_now.level

        if volume_now.status == "off" then
            vlevel = vlevel .. "M "
        else
            vlevel = vlevel .. " "
        end

        widget:set_markup(markup.font(theme.font, markup(gray, header) .. vlevel))
    end
})

local volume = lain.widget.pulse {
    settings = function()
        vlevel = volume_now.left
        if volume_now.muted == "yes" then
            vlevel = vlevel .. " M"
        end
        widget:set_markup(markup.font(theme.font, markup(gray, " Vol ") .. vlevel .. " "))
    end
}

-- Weather
theme.weather = lain.widget.weather({
    city_id = 3134521,
    font = "Misc Tamsyn 14",
})

-- Separators
local first = wibox.widget.textbox(markup.font("Misc Tamsyn 4", " "))
local spr   = wibox.widget.textbox(' ')

local function update_txt_layoutbox(s)
    -- Writes a string representation of the current layout in a textbox widget
    local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
    s.mytxtlayoutbox:set_text(txt_l)
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- /home fs
    theme.fs = lain.widget.fs({
        partition = "/home",
        notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Misc Tamsyn 14" },
    })

    -- Calendar
    --lain.widget.calendar({
    --    attach_to = { mytextclock },
    --    notification_preset = {
    --        font = "Misc Tamsyn 14",
    --        fg   = theme.fg_normal,
    --        bg   = theme.bg_normal
    --    }
    --})

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Textual layoutbox
    s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
    awful.tag.attached_connect_signal(s, "property::selected", function () update_txt_layoutbox(s) end)
    awful.tag.attached_connect_signal(s, "property::layout", function () update_txt_layoutbox(s) end)
    s.mytxtlayoutbox:buttons(awful.util.table.join(
                           awful.button({}, 1, function() awful.layout.inc(1) end),
                           awful.button({}, 3, function() awful.layout.inc(-1) end),
                           awful.button({}, 4, function() awful.layout.inc(1) end),
                           awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create systray
    systray = wibox.widget {
        set_base_size = 30,
        widget = wibox.widget.systray,
    }
    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 32 })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            first,
            s.mytaglist,
            spr,
            s.mytxtlayoutbox,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            systray,
            spr,
            cpu.widget,
            mem.widget,
            bat.widget,
            net.widget,
            volume.widget,
            mytextclock
        },
    }
end

return theme
