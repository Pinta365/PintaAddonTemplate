--Config.lua
--This file holds most of the addon configuration and things that you want to be able to share or access across the addon.

--Store the addon namespace PT in a variable
local _, PT = ...

--Addon information parsed from TOC
PT.addon = {
    title = C_AddOns.GetAddOnMetadata("PintaAddonTemplate", "Title"),
    version = C_AddOns.GetAddOnMetadata("PintaAddonTemplate", "Version")
}

--Default configuration
PT.addonDefaults = {
    debug = false
}

--Helper color codes
PT.colors = {
    -- Various colors.
    PRIMARY = "ff45D388",
    WHITE = "ffFFFFFF",
    YELLOW = "ffFFFF00",

    --Class colors.
    DEATHKNIGHT = "ffC41E3A",
    DEMONHUNTER = "ffA330C9",
    DRUID = "ffFF7C0A",
    EVOKER = "ff33937F",
    HUNTER = "ffAAD372",
    MAGE = "ff3FC7EB",
    MONK = "ff00FF98",
    PALADIN = "ffF48CBA",
    PRIEST = "ffFFFFFF",
    ROGUE = "ffFFF468",
    SHAMAN = "ff0070DD",
    WARLOCK = "ff8788EE",
    WARRIOR = "ffC69B6D"
}
