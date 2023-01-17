--GitSigns
require('gitsigns').setup()

--Nvim-Autopairs
require("nvim-autopairs").setup{}

--Nvim-Colorizer
require'colorizer'.setup()

--Indent-BlankLine
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

-- Nvim-Multiple-Cursors
vim.g.VM_show_warnings = 0

-- TagBar
vim.g.tagbar_autofocus = 1

-- ToggleTerm
require("toggleterm").setup({
    size = vim.o.columns * 0.45
})
