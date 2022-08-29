-- BLAKEJC94S NEOVIM INIT.LUA
-- --------------------------

local PACKER_CONFIG = {
    plugins = require("plugins"),
    configs = require("configs"),
}
local NVIM_CONFIG = {
    options =      require('options'),
    functions =    require('functions'),
    autocommands = require('autocommands'),
    commands =     require('commands'),
    mappings =     require('mappings'),
}
vim.g.mapleader = " "

local utils = require('utils')
utils.setup_packer()
local status_ok, packer = pcall(require, "packer")
if status_ok then utils.add_plugins(PACKER_CONFIG, packer) end
-- if status_ok then utils.add_plugins_NEW(PACKER_CONFIG, packer) end
for key, table in pairs(NVIM_CONFIG) do utils.load(key, table) end
