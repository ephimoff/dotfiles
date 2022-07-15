hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

local cmd_alt_ctrl = {"cmd", "alt", "ctrl"}

-- go Left
hs.hotkey.bind(cmd_alt_ctrl, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- go Right
hs.hotkey.bind(cmd_alt_ctrl, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Maximise
hs.hotkey.bind(cmd_alt_ctrl, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- Move to the next screen
hs.hotkey.bind(cmd_alt_ctrl, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local next = screen:next()
  local max = screen:frame()
  win:moveToScreen(next, false, true, 0)
end)

-- hints:
-- to find the application run `hs.application'term'` in the console, where 'term' is part of the app
-- see http://www.hammerspoon.org/docs/hs.application.html#find

-- external monitor layout
hs.hotkey.bind(cmd_alt_ctrl, "M", function()
  local targetScreen = "DELL P2319H"
  local secondaryScreen = "Colour LCD"
  local windowLayout = {
      -- left
      {"Safari", nil, targetScreen, hs.layout.left50, nil, nil},
      {"Mail", nil, targetScreen, hs.layout.left50, nil, nil},
      {"Finder", nil, targetScreen, hs.layout.left50, nil, nil},
      {"Reminders", nil, targetScreen, hs.layout.left30, nil, nil},
      {"Preview", nil, targetScreen, hs.layout.left50, nil, nil},
      {"Code", nil, targetScreen, hs.layout.left50, nil, nil},
      {"Google Chrome", nil, targetScreen, hs.layout.left50, nil, nil},
      {"Brave Browser", nil, targetScreen, hs.layout.left50, nil, nil},
      {"Skype", nil, targetScreen, hs.layout.left50, nil, nil},
      {"Spark", nil, targetScreen, hs.layout.left50, nil, nil},
      
      -- right
      {"Notes", nil, targetScreen, hs.layout.right50, nil, nil},
      {"Terminal", nil, targetScreen, hs.layout.right50, nil, nil},
      {"Messages", nil, targetScreen, hs.layout.right30, nil, nil},
      {"Telegram", nil, targetScreen, hs.layout.right30, nil, nil},
      {"Photos", nil, targetScreen, hs.layout.right50, nil, nil},
      {"1Password 7", nil, targetScreen, hs.layout.right50, nil, nil},
      {"Slack", nil, targetScreen, hs.layout.right50, nil, nil},
      {"Postman", nil, targetScreen, hs.layout.right50, nil, nil},
      {"Fantastical", nil, targetScreen, hs.layout.right50, nil, nil},

      -- maximised
      {"Music", nil, secondaryScreen, hs.layout.maximized, nil, nil}, -- to move it to fullscreen
      {"zoom.us", nil, secondaryScreen, hs.layout.maximized, nil, nil}, -- to move it to fullscreen
      {"Todoist", nil, secondaryScreen, hs.layout.maximized, nil, nil}, -- to move it to fullscreen
      {"IPC360", nil, secondaryScreen, hs.layout.maximized, nil, nil}, -- to move it to fullscreen
      -- {"Fantastical", nil, targetScreen, hs.layout.maximized, nil, nil},
      -- {"Microsoft Excel", nil, targetScreen, hs.layout.maximized, nil, nil},
  }
  hs.layout.apply(windowLayout)
end)

-- laptop monitor layout
hs.hotkey.bind(cmd_alt_ctrl, "L", function()
  local targetScreen = "Colour LCD"
  local windowLayout = {
      -- left
      {"Reminders", nil, targetScreen, hs.layout.left50, nil, nil},
      {"Telegram", nil, targetScreen, hs.layout.left50, nil, nil},
      {"Skype", nil, targetScreen, hs.layout.left50, nil, nil},

      -- right
      {"Messages", nil, targetScreen, hs.layout.right50, nil, nil},
      {"Notes", nil, targetScreen, hs.layout.right50, nil, nil},

      -- maximised
      {"Finder", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Safari", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Brave Browser", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Terminal", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Mail", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Photos", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Preview", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Music", nil, targetScreen, hs.layout.maximized, nil, nil}, -- to move it to fullscreen
      {"Google Chrome", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"1Password 7", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Code", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Fantastical", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Notion", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Slack", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Sequel Pro", nil, targetScreen, hs.layout.maximized, nil, nil},
      {"Spark", nil, targetScreen, hs.layout.maximized, nil, nil},
      -- {"Microsoft Excel", nil, targetScreen, hs.layout.maximized, nil, nil},
  }
  hs.layout.apply(windowLayout)
end)
