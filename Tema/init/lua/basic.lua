vim.o.rnu = true
vim.o.nu = true
vim.o.mouse = "a"
vim.o.cursorline = true
vim.cmd "lang en_US.UTF-8"
vim.cmd "set wildmode=longest:full,full"
vim.o.ic = true --Ignora la Capitalizacion de las letras en la busqueda = true
vim.o.updatetime = 300 -- Tiempo de actualizacion de CoC
vim.o.smartindent = true
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
vim.opt.completeopt= "menu,menuone,noselect"

vim.o.wildignore=vim.o.wildignore.."*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite"
vim.o.wildignore=vim.o.wildignore.."*.o,*.obj,.git,*.rbc,*.pyc,__pycache__"
vim.opt.undofile  = true
vim.opt.undodir = { vim.fn.expand("~/.local/share/nvim/undo") }
-- vim.opt.backupdir = { home .. ".backup//"}
-- vim.opt.directory = { home .. ".swp//"}

vim.cmd ([[
  " Automatically deletes all trailing whitespace and newlines at end of file on save.
  autocmd BufWritePre * norm mf
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritePre * %s/\n\+\%$//e
  autocmd BufWritePre *.[ch] %s/\%$/\r/e
  autocmd BufWritePre * norm `f
  autocmd BufWritePre * norm dmf

  " Cambia entre el cursor cuadrado ( [] ) en modo normal al cursor de barrita ( | ) en el modo de insercion
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[2 q"
  let &t_SR = "\<Esc>[4 q"

  " reset the cursor on start (for older versions of vim, usually not required)
  augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\e[2 q"            "
  augroup END

  " Quita los nu y rnu en la terminal
  autocmd TermOpen * setlocal nonumber norelativenumber
  ]])

-- "*****************************************************************************
-- "" Basic Setup
-- "*****************************************************************************"
-- Agrega icono al costado de los folds
vim.opt.foldcolumn = "1"

-- Fix backspace indent
vim.cmd ([[set backspace=indent,eol,start]])

-- Tabs. May be overridden by autocmd rules
vim.o.tabstop     = 2
vim.o.softtabstop = 0
vim.o.shiftwidth  = 2
vim.o.expandtab   = true

-- Searching
vim.o.smartcase   = true

-- ¿NECESARIO???
-- vim.o.fileformats={unix,dos,mac}

vim.cmd([[
  if exists('$SHELL')
      set shell=$SHELL
  else
      set shell=/bin/sh
  endif
  ]])

-- "*****************************************************************************
-- "" Visual Settings
-- "*****************************************************************************
vim.o.mousemodel  = "popup"
vim.o.guioptions  = "egmrti"

vim.o.scrolloff   = 3

-- Use modeline overrides
vim.o.modeline    = true
vim.o.modelines   = 10

vim.o.title       = true
vim.o.titleold    = "Terminal"
vim.o.titlestring = "%F"

-- "*****************************************************************************
-- "" Abbreviations
-- "*****************************************************************************
-- No one is really happy until you have this shortcuts
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
