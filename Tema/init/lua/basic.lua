vim.o.rnu = true
vim.o.nu = true
vim.o.cursorline = true
vim.o.ic = true --Ignora la Capitalizacion de las letras en la busqueda = true
vim.o.smartcase   = true
vim.opt.undofile  = true
-- vim.o.smartindent = true
vim.opt.fillchars = {
  vert = "█",
  fold = "⠀",
  -- eob = " ", -- suppress ~ at EndOfBuffer
  diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}
-- vim.o.foldmethod = "syntax" -- Maneja los folding según la sintaxis
vim.cmd "set spell! spelllang=es_es,en_us"
vim.o.clipboard = "unnamedplus"-- Combina el Portapapeles de VIM con el del Sistema
vim.o.lazyredraw = true -- Evita redibujado de ventanas innecesarios, ideal para cuanto se ejecutan macros. Para forzar el redibujado de una ventana, usar el comando /\s\+$//e<CR>'fdmf"redraw
vim.o.splitbelow = true
vim.o.splitright = true
-- vim.opt.completeopt= "menu,menuone,noselect"

vim.o.wildignore=vim.o.wildignore.."*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite"
vim.o.wildignore=vim.o.wildignore.."*.o,*.obj,.git,*.rbc,*.pyc,__pycache__"

-- "*****************************************************************************
-- "" Basic Setup
-- "*****************************************************************************"
-- Agrega icono al costado de los folds
-- vim.opt.foldcolumn = "1"

-- Tabs. May be overridden by autocmd rules
vim.o.tabstop     = 2
vim.o.softtabstop = 0
vim.o.shiftwidth  = 2
vim.o.expandtab   = true


-- "*****************************************************************************
-- "" Visual Settings
-- "*****************************************************************************
vim.o.scrolloff   = 3

vim.o.title       = true
vim.o.titleold    = "Terminal"
vim.o.titlestring = "%F"

-- "*****************************************************************************
-- "" Abbreviations
-- "*****************************************************************************
vim.cmd([[
  cnoreabbrev W! w!
  cnoreabbrev Q! q!
  cnoreabbrev Qall! qall!
  cnoreabbrev Wq wq
  cnoreabbrev Wa wa
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev Qall qall
]])

-- "*****************************************************************************
-- "" Autocmd Rules
-- "*****************************************************************************
-- Remember cursor position
local remember_cursor_position = vim.api.nvim_create_augroup("remember-cursor-position", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
 pattern = "*",
 command = [[ if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
 group = remember_cursor_position,
})

local remove_trailing_whitespaces_and_newlines = vim.api.nvim_create_augroup("remove_trailing_whitespaces_and_newlines", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre",{
  pattern = "*",
  command = "norm mf",
  group = remove_trailing_whitespaces_and_newlines,
})
vim.api.nvim_create_autocmd("BufWritePre",{
  pattern = "*",
  command = "%s/\\s\\+$//e",
  group = remove_trailing_whitespaces_and_newlines,
})
vim.api.nvim_create_autocmd("BufWritePre",{
  pattern = "*",
  command = "%s/\\n\\+\\%$//e",
  group = remove_trailing_whitespaces_and_newlines,
})
vim.api.nvim_create_autocmd("BufWritePre",{
  pattern = "*.",
  command = "[ch] %s/\\%$/\\r/e",
  group = remove_trailing_whitespaces_and_newlines,
})
vim.api.nvim_create_autocmd("BufWritePre",{
  pattern = "*",
  command = "norm `fdmf",
  group = remove_trailing_whitespaces_and_newlines,
})

local remove_nu_nru_terminal = vim.api.nvim_create_augroup("remove_nu_nru_terminal", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "setlocal nonumber norelativenumber",
  group = remove_nu_nru_terminal,
})

vim.cmd ([[
  " Cambia entre el cursor cuadrado ( [] ) en modo normal al cursor de barrita ( | ) en el modo de insercion
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[2 q"
  let &t_SR = "\<Esc>[4 q"
]])
