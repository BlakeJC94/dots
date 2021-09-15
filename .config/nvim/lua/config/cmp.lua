local cmp = require 'cmp'
local luasnip = require 'luasnip'

local check_back_space = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end


cmp.setup({
    completion = {
        completeopt = 'menu,menuone,noinsert',
        autocomplete = true,
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting ={
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                path = "[Path]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            })[entry.source.name]
            return vim_item
        end,
    },
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<S-Up>'] = cmp.mapping.scroll_docs(-4),
        ['<S-Down>'] = cmp.mapping.scroll_docs(4),
        ['<Right>'] = cmp.mapping.complete(),
        ['<Left>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.close(),
        -- ['<CR>'] = cmp.mapping.confirm {
        --     behavior = cmp.ConfirmBehavior.Insert,
        --     select = true,
        -- },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                -- cmp.confirm {
                --     behavior = cmp.ConfirmBehavior.Insert,
                --     select = true,
                -- }
                vim.fn.feedkeys(t("<C-n>"), "n")
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
            elseif check_back_space() then
                vim.fn.feedkeys(t("<Tab>"), "n")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                vim.fn.feedkeys(t("<C-p>"), "n")
            elseif luasnip.jumpable(-1) then
                vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    sources = {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'latex_symbols' },
    },
})

------- SET UP MAPPINGS
-----mapping = {
-----    ['<C-p>'] = cmp.mapping.select_prev_item(),
-----    ['<C-n>'] = cmp.mapping.select_next_item(),
-----    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
-----    ['<C-f>'] = cmp.mapping.scroll_docs(4),
-----    ['<C-Space>'] = cmp.mapping.complete(),
-----    ['<C-e>'] = cmp.mapping.close(),
-----    ['<CR>'] = cmp.mapping.confirm {
-----        behavior = cmp.ConfirmBehavior.Replace,
-----        select = true,
-----    },
-----    -- ["<Tab>"] = cmp.mapping(function(fallback)
-----    --     if vim.fn.pumvisible() == 1 then
-----    --         vim.fn.feedkeys(t("<C-n>"), "n")
-----    --     elseif luasnip.expand_or_jumpable() then
-----    --         vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
-----    --     elseif check_back_space() then
-----    --         vim.fn.feedkeys(t("<Tab>"), "n")
-----    --     else
-----    --         fallback()
-----    --     end
-----    -- end, {
-----    --     "i",
-----    --     "s",
-----    -- }),
-----    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
-----    --     if vim.fn.pumvisible() == 1 then
-----    --         vim.fn.feedkeys(t("<C-p>"), "n")
-----    --     elseif luasnip.jumpable(-1) then
-----    --         vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
-----    --     else
-----    --         fallback()
-----    --     end
-----    -- end, {
-----    --     "i",
-----    --     "s",
-----    -- }),
-----}
-----
-----
-----formatting = {
-----    format = function(entry, vim_item)
-----        -- fancy icons and a name of kind
-----        --vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
-----
-----        -- set a name for each source
-----        vim_item.menu = ({
-----            buffer = "[Buffer]",
-----            nvim_lsp = "[LSP]",
-----            luasnip = "[LuaSnip]",
-----            nvim_lua = "[Lua]",
-----            latex_symbols = "[Latex]",
-----        })[entry.source.name]
-----        return vim_item
-----    end,
-----},
-----
-----
-----cmp.setup {
-----    completion = {
-----        completeopt = 'menu,menuone,noinsert',
-----        autocomplete = true,
-----    },
-----    snippet = {
-----        expand = function(args)
-----            require('luasnip').lsp_expand(args.body)
-----        end,
-----    },
-----    -- formatting = formatting,
-----    -- mapping = mapping,
-----    sources = {
-----        { name = 'buffer' },
-----        { name = 'nvim_lsp' },
-----        { name = 'luasnip' },
-----    },
-----}
