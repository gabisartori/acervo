# Hyprland Config

This file specifies the structure and the standards used throughout files for this hyprland configuration.

## Structure

`hyprland.conf` is the file to actually be loaded by hyprland. It's alleged job is to funil the other configuration files, sourcing them in the correct order.

## Naming conventions for variables

Here is a list of the different use cases for variables and how I'll be naming them:

- Commands: PascalCase, strings that hold a certain command, the variable name is to be the description of what the command does. Example: LaunchTerminal, ScreenshotMainMonitor

- Apps and hyprland objects: camelCase, string that hold the command to launch a specific application, the variable name is to be a generic description of what the application is meant to be. Examples: fileExplorer, mainMonitor,