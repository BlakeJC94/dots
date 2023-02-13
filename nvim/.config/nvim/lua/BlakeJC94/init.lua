local M = {}

local addons = require("BlakeJC94.addons")
local options = require("BlakeJC94.options")
local commands = require("BlakeJC94.commands")
local mappings = require("BlakeJC94.mappings")
local leaders = require("BlakeJC94.leaders")
local augroups = require("BlakeJC94.augroups")

local utils = require("BlakeJC94.utils")

function M.setup(config)
    config = config or {}

    vim.g.mapleader = " "

    if config.addons then utils.set.addons(addons) end
    if config.options then utils.set.options(options) end
    if config.commands then utils.set.commands(commands) end
    if config.mappings then utils.set.mappings(mappings) end
    if config.leaders then utils.set.mappings(leaders) end
    if config.augroups then utils.set.augroups(augroups) end

    utils.add_undo_breakpoints_insert_mode_punctuation()
    utils.disable_arrow_keys()

    if config.scratchpad then require("BlakeJC94.scratchpad") end
end

M.filetype_exclude = {
    "help",
    "man",
    "packer",
    "fugitive",
    "mason",
    "FTerm",
}

M.filetype_include = {
    "bash",
    "julia",
    "lua",
    "python",
    "r",
    "rust",
    "vim",
}

return M
