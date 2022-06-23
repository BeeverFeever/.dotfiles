-- Setup nvim-cmp.
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    return
end

local snippy_status_ok, snippy = pcall(require, 'snippy')
if not snippy_status_ok then
    return
end

local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
            require('snippy').expand_snippet(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert ({
        ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif snippy.can_expand_or_advance() then
                    snippy.expand_or_advance()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif snippy.can_jump(-1) then
                    snippy.previous()
                else
                    fallback()
                end
            end, { "i", "s" }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-e>'] = cmp.mapping.close {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ['<CR>'] = cmp.mapping.confirm( { behavior = cmp.ConfirmBehavior.Insert, select = true } ),
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
                snippy = "[snip]",
                nvim_lsp = "[LSP]",
                buffer = "[buf]",
                path = "[path]"
            })[entry.source.name]
            return vim_item
        end,
    },
	sources = cmp.config.sources({
        { name = 'snippy' },
        { name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	}),
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = nil,
    }
})
