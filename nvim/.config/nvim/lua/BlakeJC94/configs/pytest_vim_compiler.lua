local M = {}
function M.config()
    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    autocmd(
        {"BufEnter"},
        {
            group = augroup("pytest_vim_compiler", {clear = true}),
            pattern = "*.py",
            callback = function() vim.cmd.compiler("pytest") end,
        }
    )
end
return M
