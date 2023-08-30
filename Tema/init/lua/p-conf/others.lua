--GitSigns
require('gitsigns').setup{
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']g', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '[g', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- Actions
        map({'n', 'v'}, '<leader>gh', ':Gitsigns stage_hunk<CR>')
        map({'n', 'v'}, '<leader>gr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>gu', gs.undo_stage_hunk)
    end
}

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
vim.g.VM_leader = 'ç'

-- TagBar
vim.g.tagbar_autofocus = 1

-- ToggleTerm
require("toggleterm").setup({
    size = vim.o.columns * 0.45
})

-- Hop
require("hop").setup()
