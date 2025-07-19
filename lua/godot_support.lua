vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.gd",
    callback = function()
        vim.bo.filetype = "gdscript"
    end
})


local gdproject = io.open(vim.fn.getcwd()..'/project.godot', 'r')
if gdproject then
    io.close(gdproject)
    local servername = './godothost'
    vim.fn.serverstop(servername)

    if vim.fn.filereadable(servername) == 1 then
        os.remove(servername)
    end
    vim.fn.serverstart './godothost'
end



function OpenGodotFileInTab(file)
    local target = vim.fn.fnamemodify(file, ":p")
    local bufnr = nil

    -- Search for the buffer, loaded or unloaded
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local bufname = vim.api.nvim_buf_get_name(buf)
        if vim.fn.fnamemodify(bufname, ":p") == target then
            bufnr = buf
            break
        end
    end

    if bufnr then
        -- Check if buffer is visible in any window
        local found = false
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(win) == bufnr then
                vim.api.nvim_set_current_win(win)
                found = true
                break
            end
        end

        if not found then
            -- Buffer exists but isn't visible, open in a new tab
            vim.cmd("tabnew")
            vim.api.nvim_win_set_buf(0, bufnr)
        end

    else
        -- Buffer doesn't exist, open normally
        vim.cmd("tabedit " .. vim.fn.fnameescape(file))
    end
end
