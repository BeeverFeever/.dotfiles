local bufnr = 32

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("CodeInNvim", { clear = true}),
    pattern = "main.c",
    callback = function ()
        vim.fn.jobstart({"make",}, {
            stdout_buffered = true,
            on_stdout = function (_, data)
                if data then
                    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
                end
            end,
            on_sterr = function (_, data)
                if data then
                    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
                end
            end
        })
    end
})
