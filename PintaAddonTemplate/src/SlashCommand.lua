--SlashCommand.lua
--This file holds the registering and handling of the slash commands.

--Store addonName and the addon namespace PT in variables
local addonName, PT = ...

--Slash commands in the format SLASH_<identifier>
SLASH_PintaAddonTemplate_CMD1 = '/pt'
SLASH_PintaAddonTemplate_CMD2 = '/PintaAddonTemplate'

---Slash command handler
---@param args string arguments following the slash command
SlashCmdList["PintaAddonTemplate_CMD"] = function(args)
    local lowercaseArgs = string.lower(args)

    if lowercaseArgs == "help" or lowercaseArgs == "info" or lowercaseArgs == "?" then
        print(WrapTextInColorCode("-------------------------------------------------", PT.colors["YELLOW"]))
        print(PT.addon.title .. " v" .. PT.addon.version)
        print(WrapTextInColorCode("-------------------------------------------------", PT.colors["YELLOW"]))

        print("Usage:")
        print("  " .. WrapTextInColorCode("/pt help", PT.colors["YELLOW"]) .. " - Show this help info")
        print("  " .. WrapTextInColorCode("/pt options", PT.colors["YELLOW"]) .. " - Show options panel")
        print("  " .. WrapTextInColorCode("/pt version", PT.colors["YELLOW"]) .. " - Print addon version number")
        print("  " .. WrapTextInColorCode("/pt reset", PT.colors["YELLOW"]) .. " - Reset to default settings and reloadUI")
        print(WrapTextInColorCode("-------------------------------------------------", PT.colors["YELLOW"]))
    elseif lowercaseArgs == "options" then
        Settings.OpenToCategory(PT.settingsCategory.ID)
    elseif lowercaseArgs == "version" then
        print(addonName .. " v" .. PT.addon.version)
    elseif lowercaseArgs == "reset" then
        --Reset to default settings.
        PintaAddonTemplateDB = CopyTable(PT.addonDefaults)
        ReloadUI()
    else
        print("Invalid command. Type '/pt help' for commands.")
    end
end
