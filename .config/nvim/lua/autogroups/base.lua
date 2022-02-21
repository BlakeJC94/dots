BASE = {
    name='default_cmds',
    cmds={
        ['*'] = {
            -- {events='VimEnter,BufNewFile', cmd="if @% == '' | exec 'Telescope find_files' | endif"},
            {events='VimResized',  cmd="wincmd ="},                  -- Auto-resize windows
            {events='BufWritePre', cmd="retab"},                     -- Replace tabs
            {events='BufWritePre', cmd="TrimSpaces"},                -- Autoremove whitespace
            -- {events='BufEnter',    cmd="set fo=crq2jpt"},             -- Override format options
            {events='InsertEnter', cmd='set cursorline nornu cc=100,101'}, -- Insertmode cursorline on
            {events='InsertLeave', cmd='set nocursorline rnu cc='},      -- Insertmode cursorline off
            -- {   -- Clear jumplist
            --     events='VimEnter',
            --     cmd="exec 'tabdo windo clearjumps' | tabnext"
            -- },
            {   -- Auto-highlight yanked text
                events='TextYankPost',
                cmd="silent! lua require'vim.highlight'.on_yank({timeout = 700})"
            },
            {   -- create nested directories if needed when creating files
                events='BufWritePre,FileWritePre',
                cmd="silent! call mkdir(expand('<afile>:p:h'), 'p')"
            },
        },
    }
}

return BASE