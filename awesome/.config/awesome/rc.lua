-- :::'###::::'##:::::'##:'########::'######:::'#######::'##::::'##:'########:
-- ::'## ##::: ##:'##: ##: ##.....::'##... ##:'##.... ##: ###::'###: ##.....::
-- :'##:. ##:: ##: ##: ##: ##::::::: ##:::..:: ##:::: ##: ####'####: ##:::::::
-- '##:::. ##: ##: ##: ##: ######:::. ######:: ##:::: ##: ## ### ##: ######:::
--  #########: ##: ##: ##: ##...:::::..... ##: ##:::: ##: ##. #: ##: ##...::::
--  ##.... ##: ##: ##: ##: ##:::::::'##::: ##: ##:::: ##: ##:.:: ##: ##:::::::
--  ##:::: ##:. ###. ###:: ########:. ######::. #######:: ##:::: ##: ########:
-- ..:::::..:::...::...:::........:::......::::.......:::..:::::..::........::
-- 
-- AUTHOR   pyratebeard <root@pyratebeard.net>
-- CODE     http://github.com/pyratebeard/dotfiles/
--

-- Standard libraries
gears         = require("gears")
awful         = require("awful")
awful.rules   = require("awful.rules")
require("awful.autofocus")

-- Widget library
wibox         = require("wibox")

-- Theme library
beautiful     = require("beautiful")

-- Notification libraries
naughty       = require("naughty")
menubar       = require("menubar")

-- Menubar widget library
vicious       = require("vicious")

-- Dropdown terminal libraries
drop          = require("scratchdrop")

-- Extra layouts library
lain          = require("lain")

-- <not sure what this does...>
awful.util.spawn_with_shell("xcompmgr -cF &")


-- Error handling
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "ARRGH! There was mutiny during startup!",
    text = awesome.startup_errors
  })
end
do
  local in_error = false
  awesome.connect_signal("debug::error", function (err)
    if in_error then return end
    in_error = true
    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "To ERR is human...",
      text = err
    })
    in_error = false
  end)
end

-- Variables 
home          = os.getenv("HOME")
config_dir    = awful.util.getdir("config")

-- User config
terminal = "urxvt"
editor = os.getenv("EDITOR") or "vi"
editor_cmd = terminal .. " -e " .. editor

-- Modkey
modkey = "Mod4"

-- Theme
beautiful.init(home.."/.config/awesome/themes/dotshare/theme.lua")

-- Wallpaper
if beautiful.wallpaper then
  for s = 1, screen.count() do
    gears.wallpaper.maximized(beautiful.wallpaper, s, true)
  end
end

-- Layouts
local layouts = {
  awful.layout.suit.floating,
  lain.layout.uselesstile,
  awful.layout.suit.tile,
  awful.layout.suit.tile.bottom,
  lain.layout.uselessfair
}

-- Tag list
tags = {}
for s = 1, screen.count() do
  tags[s] = awful.tag({
    " TERMINAL ",
    " WEB ",
--    " COMMS ",
    " CODE ",
    " OTHER"
  },
  s,
  layouts[1])
end

-- Menubar configuration
menubar.utils.terminal = terminal

-- Wibox
seperator			= wibox.widget.textbox()
seperator:set_markup("|")
spacer				= wibox.widget.textbox()
spacer:set_markup(" ")

-- CPU
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, "C:$1%")

-- Memory
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, "M:$1%", 10)

-- Network
eths = { 'eno1', 'wlp2s0' }
netwidget = wibox.widget.textbox()
vicious.register(netwidget, vicious.widgets.net, 
  function(widget,args)
    t=''
    for i = 1, #eths do
      e = eths[i]
      if args["{"..e.." carrier}"] == 1 then
        if e == 'wlp2s0' then
          t=t..'|'..'wifi: u '..args['{'..e..' up_kb}']..' d '..args['{'..e..' down_kb}']
        else
          t=t..'|'..'eth: u '..args['{'..e..' up_kb}']..' d '..args['{'..e..' down_kb}']
        end
      end
    end
    if string.len(t)>0 then -- remove leading |
      return string.sub(t,2,-1)
    end
    return 'no network'
  end
  , 1 )

-- Battery
batwidget = wibox.widget.textbox()
vicious.register(batwidget, vicious.widgets.bat, "$1$2", 32, "BAT0")

-- Date and time
datewidget = wibox.widget.textbox()
vicious.register(datewidget, vicious.widgets.date, "%a %F %R", 60)

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytasklist = {}


for s = 1, screen.count() do
	-- Create a promptbox for each screen
	mypromptbox[s] = awful.widget.prompt()
	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	mylayoutbox[s] = awful.widget.layoutbox(s)
	mylayoutbox[s]:buttons(awful.util.table.join(
						   awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
						   awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
						   awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
						   awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
	-- Create a taglist widget
	mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

	-- Create a tasklist widget
	mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

	-- Create the wibox
	mywibox[s] = awful.wibox({ position = "top", screen = s })

	-- Widgets that are aligned to the left
	local left_layout = wibox.layout.fixed.horizontal()
	-- left_layout:add(mylauncher)
	left_layout:add(mytaglist[s])
	left_layout:add(seperator)
	left_layout:add(mypromptbox[s])

	-- Widgets that are aligned to the right
	local right_layout = wibox.layout.fixed.horizontal()
	if s == 1 then right_layout:add(wibox.widget.systray()) end
	right_layout:add(spacer)
	right_layout:add(cpuwidget)
	right_layout:add(spacer)
	right_layout:add(seperator)
	right_layout:add(spacer)
	right_layout:add(memwidget)
	right_layout:add(spacer)
	right_layout:add(seperator)
	right_layout:add(spacer)
	right_layout:add(netwidget)
	right_layout:add(spacer)
	right_layout:add(seperator)
	right_layout:add(spacer)
	right_layout:add(batwidget)
	right_layout:add(spacer)
	right_layout:add(seperator)
	right_layout:add(spacer)
	right_layout:add(datewidget)
	right_layout:add(spacer)
	-- right_layout:add(mytextclock)
	-- right_layout:add(mylayoutbox[s])

	-- Now bring it all together (with the tasklist in the middle)
	local layout = wibox.layout.align.horizontal()
	layout:set_left(left_layout)
	layout:set_middle(mytasklist[s])
	layout:set_right(right_layout)

	mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
	awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
	awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
	awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

	awful.key({ modkey,           }, "j",
		function ()
			awful.client.focus.byidx( 1)
			if client.focus then client.focus:raise() end
		end),
	awful.key({ modkey,           }, "k",
		function ()
			awful.client.focus.byidx(-1)
			if client.focus then client.focus:raise() end
		end),
	awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

	-- Layout manipulation
	awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
	awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
	awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
	awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
	awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
	awful.key({ modkey,           }, "Tab",
		function ()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end),

	-- Standard program
	awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
	awful.key({ modkey, "Control" }, "r", awesome.restart),
	awful.key({ modkey, "Shift"   }, "q", awesome.quit),

	awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
	awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
	awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
	awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
	-- awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
	-- awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
	awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
	awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

	awful.key({ modkey, "Control" }, "n", awful.client.restore),

	-- Lock screen
	awful.key({ modkey, 		  }, "#94", function () awful.util.spawn("i3lock -u -i /home/pyratebeard/dot/wallpapers/pyratebeard_wallpaper_01.png -t") end),

	-- Audio
	awful.key({ modkey, 		  }, "#174", function () awful.util.spawn("mocp -P") end), -- Fn Stop (pauses)
	awful.key({ modkey, 		  }, "#172", function () awful.util.spawn("mocp -U") end), -- Fn Play (unpauses)
	awful.key({ modkey, 		  }, "#59", function () awful.util.spawn("mocp -v -5") end), -- comma (decrease vol by 5)
	awful.key({ modkey, 		  }, "#60", function () awful.util.spawn("mocp -P") end), -- perid (increase vol by 5)
	
	-- Brightness
	awful.key({ modkey,			  }, "#232", function () awful.util.spawn("xrandr --output LVDS1 --brightness 0.8") end), -- brightness down
	awful.key({ modkey,			  }, "#233", function () awful.util.spawn("xrandr --output LVDS1 --brightness 1") end), -- brightness up


	-- Dropdown terminal
	awful.key({ modkey,			  }, "`", function () drop(terminal) end),
	-- Prompt
	awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

	awful.key({ modkey }, "x",
			  function ()
				  awful.prompt.run({ prompt = "Run Lua code: " },
				  mypromptbox[mouse.screen].widget,
				  awful.util.eval, nil,
				  awful.util.getdir("cache") .. "/history_eval")
			  end),
	-- Menubar
	awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
	awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
	awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
	awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
	awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
	awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
	awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
	awful.key({ modkey,           }, "n",
		function (c)
			-- The client currently has the input focus, so it cannot be
			-- minimized, since minimized clients can't have the focus.
			c.minimized = true
		end),
	awful.key({ modkey,           }, "m",
		function (c)
			c.maximized_horizontal = not c.maximized_horizontal
			c.maximized_vertical   = not c.maximized_vertical
		end),
  awful.key({ modkey, "Shift"   }, "m",
    function (c)
      c.maximized = not c.maximized
    end),
  awful.key({ modkey, "Shift"   }, "s",
    function (c)
      c.stick = not c.sticky
    end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = awful.util.table.join(globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9,
				  function ()
						local screen = mouse.screen
						local tag = awful.tag.gettags(screen)[i]
						if tag then
						   awful.tag.viewonly(tag)
						end
				  end),
		-- Toggle tag.
		awful.key({ modkey, "Control" }, "#" .. i + 9,
				  function ()
					  local screen = mouse.screen
					  local tag = awful.tag.gettags(screen)[i]
					  if tag then
						 awful.tag.viewtoggle(tag)
					  end
				  end),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9,
				  function ()
					  if client.focus then
						  local tag = awful.tag.gettags(client.focus.screen)[i]
						  if tag then
							  awful.client.movetotag(tag)
						  end
					 end
				  end),
		-- Toggle tag.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
				  function ()
					  if client.focus then
						  local tag = awful.tag.gettags(client.focus.screen)[i]
						  if tag then
							  awful.client.toggletag(tag)
						  end
					  end
				  end))
end

clientbuttons = awful.util.table.join(
	awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
	awful.button({ modkey }, 1, awful.mouse.client.move),
	awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{ rule = { },
	  properties = { border_width = beautiful.border_width,
					 border_color = beautiful.border_normal,
					 focus = awful.client.focus.filter,
					 raise = true,
					 keys = clientkeys,
					 buttons = clientbuttons } },
	-- 
	-- Use `xprop` to find WM_CLASS
	--
	{ rule = { class = "MPlayer" },
	  properties = { floating = true } },
	{ rule = { class = "mpv" },
	  properties = { floating = true } },
	{ rule = { class = "pinentry" },
	  properties = { floating = true } },
	{ rule = { class = "gimp" },
	  properties = { floating = true } },
	{ rule = { class = "qpdfview" },
	  properties = { floating = true } },
	{ rule = { class = "Qpdfview" },
	  properties = { floating = true } },
	{ rule = { class = "sxiv" },
	  properties = { floating = true } },
	{ rule = { class = "Sxiv" },
	  properties = { floating = true } },
	{ rule = { class = "gifview" },
	  properties = { floating = true } },
	{ rule = { class = "Gifview" },
	  properties = { floating = true } },
	{ rule = { class = "keepass2" },
	  properties = { floating = true } },
	{ rule = { class = "KeePass2" },
	  properties = { floating = true } },
	-- Set Chrome to always map on tags number 2 of screen 1.
	-- { rule = { class = "Chrome" },
	--   properties = { tag = tags[1][2] } },
	--
	-- Set Firefox to always map on tags number 2 of screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
	-- Enable sloppy focus
	c:connect_signal("mouse::exit", function(c)
		if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
			and awful.client.focus.filter(c) then
			client.focus = c
		end
	end)

	if not startup then
		-- Set the windows at the slave,
		-- i.e. put it at the end of others instead of setting it master.
		awful.client.setslave(c)

    -- Put windows in a smart way, only if they does not set an initial position.
    if not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_overlap(c)
        awful.placement.no_offscreen(c)
    end
end

local titlebars_enabled = false
if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
    -- Buttons for the titlebar
    local buttons = awful.util.table.join(
            awful.button({ }, 1, function()
                client.focus = c
                c:raise()
                awful.mouse.client.move(c)
            end),
            awful.button({ }, 3, function()
                client.focus = c
                c:raise()
                awful.mouse.client.resize(c)
            end)
            )

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    -- left_layout:add(awful.titlebar.widget.iconwidget(c))
    left_layout:buttons(buttons)

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    -- right_layout:add(awful.titlebar.widget.floatingbutton(c))
    right_layout:add(awful.titlebar.widget.maximizedbutton(c))
    -- right_layout:add(awful.titlebar.widget.stickybutton(c))
    -- right_layout:add(awful.titlebar.widget.ontopbutton(c))
    right_layout:add(awful.titlebar.widget.closebutton(c))

    -- The title goes in the middle
    local middle_layout = wibox.layout.flex.horizontal()
    local title = awful.titlebar.widget.titlewidget(c)
    title:set_align("left")
    middle_layout:add(title)
    middle_layout:buttons(buttons)

    -- Now bring it all together
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_right(right_layout)
    layout:set_middle(middle_layout)

    awful.titlebar(c):set_widget(layout)
end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
