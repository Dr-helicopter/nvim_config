-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.signcolumn = "yes:6"

-- Load lazy.nvim configuration
require("config.lazy")


-- macro command for shader testing

vim.api.nvim_create_user_command(
    'RunShader',
    function()
        local file = vim.fn.expand('%:p')
        if file:match('%.glsl$') then
            vim.cmd('write') -- Save the file
            vim.fn.system('venv\\Scripts\\activate && python display_shader.py ' .. file)
        else
            print("Current file is not a .glsl file.")
        end
    end,
    {}
)




vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.lua",
    callback = function()
        local current_view = vim.fn.winsaveview()
        vim.cmd([[ %s/\s\+$//e ]]) -- Remove trailing spaces
        vim.cmd([[ %s/^\s\+/\=repeat("\t", strlen(submatch(0)) / &tabstop)/e ]]) -- Convert spaces to tabs
        vim.fn.winrestview(current_view)
    end
})
