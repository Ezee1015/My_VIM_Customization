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

-- Select between diferents coloschemes
vim.cmd "colorscheme tokyonight"
  -- Antiguos ColorSchemes:
    -- dracula
    -- gruvbox
    -- onedark
    -- molokai
    -- ghdark
    -- GruberDarker
    -- PaperColor


vim.o.background = 'dark'
-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_style = "night"

vim.g.airline_theme = 'base16_gruvbox_dark_hard'

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
-- ¿NECESARIO????
-- let no_buffers_menu=1

vim.o.mousemodel  = popup
vim.o.guioptions  = egmrti

-- ¿NECESARIO????
-- vim.cmd([[
-- if &term =~ '256color'
--   set t_ut=
-- endif
-- ]])

vim.o.scrolloff   = 3

-- Use modeline overrides
vim.o.modeline    = true
vim.o.modelines   = 10

vim.o.title       = true
vim.o.titleold    = "Terminal"
vim.o.titlestring = "%F"

vim.cmd ([[
  " MARCA DE ROJO los caracteres no ascii que pueden dar problemas en el codigo
  syntax match nonascii "[^\x00-\x7F]"
  highlight nonascii guibg=Red ctermbg=2

  " Disable visualbell
  set noerrorbells visualbell t_vb=
  if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
  endif

  " Funciona para archivo C y C++
  autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
  ]])


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
vim.cmd([[
  "" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
    augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
    augroup END

  "" Remember cursor position
  augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup END

  "" Cambia entre el cursor PARA NVIM
  " let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50

  "" make/cmake
  augroup vimrc-make-cmake
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
  augroup END
  ]])

-- En cuanto al comando time en la funcion de compilar...
--    Real...   is wall clock time - time from start to finish of the call. This is all elapsed time including time slices used by other processes and time the process spends blocked (for example if it is waiting for I/O to complete).
--    User...  is the amount of CPU time spent in user-mode code (outside the kernel) within the process. This is only actual CPU time used in executing the process. Other processes and time the process spends blocked do not count towards this figure.
--    Sys...   is the amount of CPU time spent in the kernel within the process. This means executing CPU time spent in system calls within the kernel, as opposed to library code, which is still running in user-space. Like 'user', this is only CPU time used by the process. See below for a brief description of kernel mode (also known as 'supervisor' mode) and the system call mechanism.
