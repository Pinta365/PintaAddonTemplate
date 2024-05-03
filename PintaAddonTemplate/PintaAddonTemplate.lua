--PintaAddonTemplate.lua
--This file acts as the entry point of the addon and initialization.

--Store addonName and the addon namespace PT in variables
local addonName, PT = ...

--Create a main addon frame to register events on.
local f = CreateFrame("Frame")

---Main event handler function.
---@param self frame main addon frame
---@param event string event name
---@param ... unknown event variables
local function OnEvent(self, event, ...)
    -- Addon Loaded, initialize addon if its our addon triggering the event.
    if event == "ADDON_LOADED" and ... == "PintaAddonTemplate" then
        -- Load global PintaAddonTemplateDB, this variable is saved over sessions. See TOC-file
        PintaAddonTemplateDB = PintaAddonTemplateDB or CopyTable(PT.addonDefaults)

        -- Create options frame, see OptionsPanel.lua
        PT.InitOptions()

        -- Print "loaded" message if debug-config is true
        PT.debugPrint(addonName .. " v" .. PT.addon.version .. " is loaded.")
    end
end

--Set function to handle events.
f:SetScript("OnEvent", OnEvent)

--Register for the ADDON_LOADED event so that we can use that to initialize the addon.
f:RegisterEvent("ADDON_LOADED")
