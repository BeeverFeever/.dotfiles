local snippy = utils.get_package("snippy")
local cmp = utils.get_package("cmp")

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 20

-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

cmp.setup({
    snippet = {
        expand = function(args)
            require('snippy').expand_snippet(args.body)
        end,
    },
    mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
                -- elseif has_words_before() then
                --     cmp.complete()
            else
                fallback()
            end
        end, { "i", "s", }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
                snippy.previous()
            else
                fallback()
            end
        end, { "i", "s", }),
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
            -- have to set menu before kind as it references vim_item.kind when
            -- it is a string not an icon
            vim_item.menu = "(" .. (string.format("%s", vim_item.kind) or "") .. ")"
            vim_item.kind = string.format(" %s", settings.icons.lsp[vim_item.kind])
            -- vim_item.kind = string.format(" %s %s", settings.icons.lsp[vim_item.kind], vim_item.kind)
            -- vim_item.menu = ({
            --     snippy = "(Snip)",
            --     nvim_lsp = "(Lsp)",
            --     buffer = "(Buf)",
            --     path = "(Path)"
            -- })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "snippy" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
    },
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        },
        documentation = {
            border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        }
    },
})


-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    },
    view = {
        entries = "wildmenu",
    },
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    },
    view = {
        entries = "wildmenu",
    },
})
