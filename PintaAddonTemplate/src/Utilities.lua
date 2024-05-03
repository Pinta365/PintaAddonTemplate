--Utilities.lua
--This file holds utility functionallity shared across the addon.

--Store the addon namespace PT in a variable
local _, PT = ...

---Helper function to print debug messages
---@param message string
PT.debugPrint = function(message)
    if PintaAddonTemplateDB.debug then
        print((PT.addon.title or "") .. WrapTextInColorCode(" debug: ", PT.colors["PRIMARY"]) .. tostring(message))
    end
end

---Helper function to set or hook script to a frame.
---@param frame frame frame to attach script to
---@param event string event name
---@param func function function to attach
PT.setOrHookHandler = function(frame, event, func)
    if frame:GetScript(event) then
        frame:HookScript(event, func)
    else
        frame:SetScript(event, func)
    end
end
