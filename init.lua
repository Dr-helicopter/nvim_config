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
