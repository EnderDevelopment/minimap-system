# MiniMap System

A customizable 3D mini-map for FiveM players and vehicles.

## Features

- Displays a 3D mini-map for players and vehicles
- Customizable mini-map size, position, and visibility

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your FiveM server's resources folder
3. Add `start MiniMapSystem` to your server.cfg file
4. Import the database.sql file into your MySQL database

## Usage

The mini-map will automatically appear on the screen. You can customize its size, position, and visibility in the config.lua file.

## Configuration

You can customize the mini-map settings in the config.lua file:

```lua
Config = {}

-- Mini-map settings
Config.MiniMap = {
    Size = 0.2, -- Size of the mini-map
    Position = { x = 0.15, y = 0.15 }, -- Position of the mini-map on the screen
    Visible = true -- Visibility of the mini-map
}

-- Database settings
Config.Database = {
    TableName = 'mini_map_settings'
}
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=minimap-system&utm_content=bottom) — describe it in one sentence and get the full source code.
