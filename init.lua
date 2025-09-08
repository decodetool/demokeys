local steps = {
    "npm run dev",
    "open http://localhost:3000",
    "git commit -m \"demo\" && git push",
    "line 1\nline 2\nline 3",
    [[
This is a multiline string.
It can contain "quotes", 'single quotes',
and spans across multiple lines.

Line breaks are preserved exactly.
]]
  }
  
  local i = 1
  local speed = 0.025
  
  -- helper to type text at fixed speed
  local function typeOut(text, delay)
    local len = #text
    local pos = 1
    local t = hs.timer.doEvery(delay, function()
      if pos <= len then
        hs.eventtap.keyStrokes(text:sub(pos, pos))
        pos = pos + 1
      else
        t:stop()
      end
    end)
  end

  local function typeOutNatural(text)
    local pos = 1
    local function typeNext()
      if pos <= #text then
        local ch = text:sub(pos, pos)
  
        if ch == "\n" then
          -- Send a Return key instead of trying to "type" the newline
          hs.eventtap.keyStroke({}, "return")
        else
          hs.eventtap.keyStrokes(ch)
        end
  
        pos = pos + 1
        local jitter = speed * 0.5 + math.random() * speed  -- adds variation
        hs.timer.doAfter(jitter, typeNext)
      end
    end
    typeNext()
  end
  
  
  
  hs.hotkey.bind({"shift", "cmd"}, "P", function()
    if hs.eventtap.isSecureInputEnabled() then
      hs.alert.show("Secure Input is ON; can't type here.")
      return
    end
    if steps[i] then
        -- typeOut(steps[i], speed) -- 0.05s between chars (20 cps)
        typeOutNatural(steps[i])
    --   hs.alert.show(("Step %d/%d"):format(i, steps), 0.6)
      if i < #steps then i = i + 1 end
    end
  end)
  

  
  
  hs.hotkey.bind({"shift", "alt"}, "P", function()
    i = 1
  end)
  