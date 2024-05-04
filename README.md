## PintaAddonTemplate 

A well-structured starting point for creating World of Warcraft addons.

### Features

*   **Modular Design:** Code is organized into separate files for configuration, utilities, options panel, and slash commands.
*   **Basic Options Panel:** Provides some examples to create checkboxes, buttons, and dropdowns.
*   **Slash Commands:** Includes `/pt` with example commands for help, options, version display, and addon reset. 
*   **Debug Logging:**  Configurable debug output to assist in development.

### Installation

1.  **Download:**  Download the latest version of the addon. You can either:
    *   Download the [zip file](https://github.com/Pinta365/PintaAddonTemplate/releases) from the repository.
    *   Clone the repository.
2.  **Rename:** Rename the content:
    *   Rename the `PintaAddonTemplate` folder to the desired name of your addon. 
    *   Rename the main lua and toc file to match your folder name. There are also a few places in the files you need to update.
3.  **Install:** Place the renamed folder in your World of Warcraft installation directory, within the following path:

    ```
    World of Warcraft\_retail_\Interface\AddOns\
    ```

### Folder and files.
```
│   README.md                        -- This file
│
├───.vscode
│       settings.json                -- vscode settings to add wow specific globals
│
└───PintaAddonTemplate               -- This is the root of the actual addon
    │   PintaAddonTemplate.lua       -- Main entry point for the addon
    │   PintaAddonTemplate.toc       -- The TOC-file must be the same name as the folder name.
    │
    ├───src
    │       Config.lua               -- Shared config variables used througout the addon
    │       OptionsPanel.lua         -- Code to showcase a simple options panel
    │       SlashCommand.lua         -- Create the addons slash command
    │       Utilities.lua            -- Various shared utility functions
    │
    └───Textures
            pinta.tga                -- Icon to show in the addon listing
```