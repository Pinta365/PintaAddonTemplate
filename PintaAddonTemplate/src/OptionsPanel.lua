--OptionsPanel.lua
--This file holds functionallity to create a simple options panel.

---@diagnostic disable: undefined-doc-name

--Store addonName and the addon namespace PT in variables
local addonName, PT = ...

---Helper function to create option check button.
---@param parent optionsPanel
---@param displayText string Text associated to options item
---@param name string name of item
---@param x number x position
---@param y number y position
---@return CheckButton|InterfaceOptionsCheckButtonTemplate
local function createOptionCheckButton(parent, displayText, name, x, y)
    local checkbutton = CreateFrame("CheckButton", name, parent, "InterfaceOptionsCheckButtonTemplate")
    checkbutton:SetPoint("TOPLEFT", x, y)
    ---@diagnostic disable-next-line: undefined-field
    checkbutton.Text:SetText(displayText)
    return checkbutton
end

---Helper function to create option button.
---@param parent optionsPanel
---@param displayText string Text associated to options item
---@param name string name of item
---@param x number x position
---@param y number y position
---@param w number width of button
---@param h number height of button
---@return Button|UIPanelButtonTemplate
local function createOptionButton(parent, displayText, name, x, y, w, h)
    local button = CreateFrame("Button", name, parent, "UIPanelButtonTemplate")
    button:SetPoint("TOPLEFT", x, y)
    button:SetWidth(w)
    button:SetHeight(h)
    ---@diagnostic disable-next-line: undefined-field
    button.Text:SetText(displayText)
    return button
end

---Helper function to generate a menu.
---@param frame frame
function Template_Menu(frame)
    local info = UIDropDownMenu_CreateInfo()

    local menuItems = {
        {
            --Option 1
            text = "Option 1",
            func = function()
                UIDropDownMenu_SetText(frame, "Option 1")
            end,
        },
        {
            --Option 2
            text = "Option 2",
            func = function()
                UIDropDownMenu_SetText(frame, "Option 2")
            end,
        }
    }

    -- Loop over the menu items and add them to the menu
    for _, item in ipairs(menuItems) do
        info.text = item.text
        info.func = item.func
        UIDropDownMenu_AddButton(info)
    end
end

---Helper function to create dropdown.
---@param parent optionsPanel
---@param displayText string Text associated to options item
---@param name string name of item
---@param x number x position
---@param y number y position
---@param w number width of dropdown
---@return Frame|UIDropDownMenuTemplate
local function createOptionDropdown(parent, displayText, name, x, y, w)
    local dropDown = CreateFrame("Frame", name, parent, "UIDropDownMenuTemplate")
    dropDown:SetPoint("TOPLEFT", x, y)
    UIDropDownMenu_SetWidth(dropDown, w)
    UIDropDownMenu_Initialize(dropDown, Template_Menu)
    UIDropDownMenu_SetText(dropDown, displayText)
    return dropDown
end

---Create the options panel
PT.InitOptions = function()
    ---@class optionsPanel : Frame
    local optionsPanel = CreateFrame("Frame", "AddonOptionsPanel", InterfaceOptionsFramePanelContainer)
    optionsPanel.name = addonName

    -- Create a toggle for the "Debug" option.
    local debugCheckbox = createOptionCheckButton(optionsPanel, "Debug text", "ToggleDebugCheckbox", 16, -16)
    PT.setOrHookHandler(debugCheckbox, "OnClick", function(self)
        PintaAddonTemplateDB.debug = self:GetChecked()
    end)
    debugCheckbox:SetChecked(PintaAddonTemplateDB.debug)

    -- Create sample test button, does nothing but print a debug message.
    local testButton = createOptionButton(optionsPanel, "Test text", "TestButton", 16, -48, 100, 25)
    PT.setOrHookHandler(testButton, "OnClick", function()
        PT.debugPrint("Button clicked.")
    end)

    -- Create a dropdown that does nothing.
    createOptionDropdown(optionsPanel, "Test text", "TestDropDown", 0, -96, 100)

    --Add panel to interface
    local category, layout = Settings.RegisterCanvasLayoutCategory(optionsPanel, optionsPanel.name);
    Settings.RegisterAddOnCategory(category);
    PT.settingsCategory = category
end
