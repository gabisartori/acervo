-- Neovim settings
-- Leave tabstop at deafult value of 8 spaces
-- This is because I don't want to use tabs, so they should stick out
-- vim.opt.tabstop = 8
-- Automatic identation for when breaking lines;
vim.opt.shiftwidth = 4
-- Indent using spaces instead of tabs
vim.opt.expandtab = true
-- Syntax highlighting
vim.opt.syntax = "on"
-- Show line numbers
vim.opt.number = true
-- Highlight the current line the cursor is on
vim.opt.cursorline = true
-- Set clipboard to be the same as the system instead of its own
vim.opt.clipboard = "unnamedplus"


-- PLUGINS
-- lazy.nvim plugin manager
require("config.lazy")

-- Disable hererocks
-- opts.rocks.hererocks = false


