hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- go Left
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
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
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
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
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
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

-- hints:
-- to find the application run `hs.application'term'` in the console, where 'term' is part of the app
-- see http://www.hammerspoon.org/docs/hs.application.html#find

-- external monitor layout
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", function()
  local laptopScreen = "Q27P1B"
  local windowLayout = {
      -- left
      {"Safari", nil, laptopScreen, hs.layout.left50, nil, nil},
      {"Code", nil, laptopScreen, hs.layout.left50, nil, nil},
      {"Mail", nil, laptopScreen, hs.layout.left50, nil, nil},
      {"Spark", nil, laptopScreen, hs.layout.left50, nil, nil},
      {"Google Chrome", nil, laptopScreen, hs.layout.left50, nil, nil},
      {"Finder", nil, laptopScreen, hs.layout.left50, nil, nil},
      {"Preview", nil, laptopScreen, hs.layout.left50, nil, nil},

      -- right
      {"1Password 7", nil, laptopScreen, hs.layout.right50, nil, nil},
      {"Terminal", nil, laptopScreen, hs.layout.right50, nil, nil},
      {"Notes", nil, laptopScreen, hs.layout.right50, nil, nil},
      {"Messages", nil, laptopScreen, hs.layout.right30, nil, nil},
      -- {"Microsoft Teams", nil, laptopScreen, hs.layout.right50, nil, nil},
      {"Slack", nil, laptopScreen, hs.layout.right50, nil, nil},

      -- maximised
      {"Fantastical", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Notion", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Microsoft Excel", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"iTunes", "iTunes", laptopScreen, hs.layout.maximized, nil, nil},
  }
  hs.layout.apply(windowLayout)
end)

-- laptop monitor layout
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  local laptopScreen = "Color LCD"
  local windowLayout = {
      {"Safari", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Google Chrome", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"1Password 7", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Terminal", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Code", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Notes", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Messages", nil, laptopScreen, hs.layout.right50, nil, nil},
      {"Mail", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Spark", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Fantastical", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Notion", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Finder", nil, laptopScreen, hs.layout.maximized, nil, nil},
      -- {"Microsoft Teams", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Slack", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Microsoft Excel", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"Preview", nil, laptopScreen, hs.layout.maximized, nil, nil},
      {"iTunes", "iTunes", laptopScreen, hs.layout.maximized, nil, nil},
  }
  hs.layout.apply(windowLayout)
end)
