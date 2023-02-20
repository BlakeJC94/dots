local M = {}

M.requires = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "otavioschwanck/telescope-alternate",
}

function M.config()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- Use <C-q> to send results to qf
    local telescope_mappings = {
        n = { ["q"] = actions.close },
        i = { ["<esc>"] = actions.close },
    }

    local empty_borderchars = { " ", " ", " ", " ", " ", " ", " ", " " }

    telescope.setup({
        defaults = {
            theme = "ivy",
            borderchars = empty_borderchars,
            mappings = telescope_mappings,
            file_ignore_patterns = { "%.git/", "%/__pycache__/", "%/data/" },
        },
        pickers = {
            find_files = {
                hidden = true,
                theme = "ivy",
                borderchars = empty_borderchars,
            },
            git_status = {
                git_icons = {
                    added = "",
                    changed = "",
                    copied = "",
                    deleted = "",
                    renamed = "",
                    unmerged = "",
                    untracked = "",
                },
            },
            registers = {
                theme = "ivy",
                borderchars = empty_borderchars,
            },
            spell_suggest = {
                theme = "ivy",
                borderchars = empty_borderchars,
            },
        },
        extensions = {
            ["fzf"] = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
            ["file_browser"] = {
                theme = "ivy",
                borderchars = empty_borderchars,
                -- layout_config = {
                --     width = 60,
                -- },
                previewer = false,
                hijack_netrw = false,
                path = "%:p:h",
                grouped = true,
                hidden = true,
                display_stat = false,
                file_ignore_patterns = { "%/.git/", "%/__pycache__/" },
            },
            ["telescope-alternate"] = {
                mappings = {
                    { "[^/]+(.*)/([^/]*).py", { { "tests[1]/test_[2].py", "Test", true } } },
                    { "tests(.*)/test_(.*).py", { { "*[1]/[2].py", "Implementation", false } } },
                },
            },
        },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("telescope-alternate")

    vim.api.nvim_create_user_command(
        "A",
        function()
            require("telescope").extensions["telescope-alternate"].alternate_file({label="Test"})
        end,
        { force = true }
    )
end

return M
