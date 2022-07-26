vim.o.rnu = true
vim.o.nu = true
vim.o.mouse = "a"
vim.o.cursorline = true
vim.cmd "lang en_US.UTF-8"
vim.o.wildmode = longest,list,full --Autocompleta Rutas
vim.o.ic = true --Ignora la Capitalizacion de las letras en la busqueda = true
vim.o.updatetime = 300 -- Tiempo de actualizacion de CoC
vim.o.smartindent = true
vim.o.termguicolors = true
vim.cmd "set noshowmode"
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
vim.o.foldmethod = "syntax" -- Maneja los folding según la sintaxis
vim.cmd "set spell! spelllang=es_es,en_us"
vim.o.clipboard = "unnamedplus"-- Combina el Portapapeles de VIM con el del Sistema
vim.o.lazyredraw = true -- Evita redibujado de ventanas innecesarios, ideal para cuanto se ejecutan macros. Para forzar el redibujado de una ventana, usar el comando :redraw

vim.o.undofile = true
vim.o.undodir = "~/.vim/undodir"

-- Automatically deletes all trailing whitespace and newlines at end of file on save.
vim.cmd ([[autocmd BufWritePre * %s/\s\+$//e]])
vim.cmd ([[autocmd BufWritePre * %s/\n\+\%$//e]])
vim.cmd ([[autocmd BufWritePre *.[ch] %s/\%$/\r/e]])

-- Cambia entre el cursor cuadrado ( [] ) en modo normal al cursor de barrita ( | ) en el modo de insercion
vim.cmd ([[let &t_SI = "\e[6 q"]])
vim.cmd ([[let &t_EI = "\e[2 q"]])
vim.cmd ([[let &t_SR = "\<Esc>[4 q"]])
-- reset the cursor on start (for older versions of vim, usually not required)
vim.cmd ([[augroup myCmds]])
vim.cmd ([[au!]])
vim.cmd ([[autocmd VimEnter * silent !echo -ne "\e[2 q"            "]])
vim.cmd ([[augroup END]])

-- Select between diferents coloschemes
-- vim.cmd "colorscheme dracula"
vim.cmd "colorscheme gruvbox"
-- vim.cmd "colorscheme onedark"
-- vim.cmd "colorscheme molokai"
-- vim.cmd "colorscheme ghdark"
-- vim.cmd "colorscheme GruberDarker"
-- vim.cmd "colorscheme PaperColor"
-- vim.cmd "colorscheme tokyonight"

vim.o.background = 'dark'
-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_style = "night"

vim.g.airline_theme = 'base16_gruvbox_dark_hard'




-- "*****************************************************************************
-- "" Basic Setup
-- "*****************************************************************************"
-- "" Encoding
-- set encoding=utf-8
-- set fileencoding=utf-8
-- set fileencodings=utf-8
-- set ttyfast

-- "" Fix backspace indent
-- set backspace=indent,eol,start

-- "" Tabs. May be overridden by autocmd rules
-- set tabstop=4
-- set softtabstop=0
-- set shiftwidth=4
-- set expandtab

-- "" Map leader to ,
-- let mapleader=','

-- "" Enable hidden buffers
-- set hidden

-- "" Searching
-- set hlsearch
-- set incsearch
-- set ignorecase
-- set smartcase

-- set fileformats=unix,dos,mac

-- if exists('$SHELL')
--     set shell=$SHELL
-- else
--     set shell=/bin/sh
-- endif

-- "*****************************************************************************
-- "" Visual Settings
-- "*****************************************************************************
-- let no_buffers_menu=1

-- set mousemodel=popup
-- set t_Co=256
-- set guioptions=egmrti
-- set gfn=Monospace\ 10

-- if has("gui_running")
--   if has("gui_mac") || has("gui_macvim")
--     set guifont=Menlo:h12
--     set transparency=7
--   endif
-- else
--   let g:CSApprox_loaded = 1

--   " IndentLine
--   let g:indentLine_enabled = 1
--   let g:indentLine_concealcursor = 0
--   let g:indentLine_char = '┆'
--   let g:indentLine_faster = 1


--   if $COLORTERM == 'gnome-terminal'
--     set term=gnome-256color
--   else
--     if $TERM == 'xterm'
--       set term=xterm-256color
--     endif
--   endif

-- endif


-- if &term =~ '256color'
--   set t_ut=
-- endif


-- "" Disable the blinking cursor.
-- set gcr=a:blinkon0

-- set scrolloff=3


-- "" Status bar
-- set laststatus=2

-- "" Use modeline overrides
-- set modeline
-- set modelines=10

-- set title
-- set titleold="Terminal"
-- set titlestring=%F

-- set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

-- " Search mappings: These will make it so that going to the next one in a
-- " search will center on the line it's found in.
-- nnoremap n nzzzv
-- nnoremap N Nzzzv

-- if exists("*fugitive#statusline")
--   set statusline+=%{fugitive#statusline()}
-- endif

-- " vim-airline
-- " let g:airline_theme = 'powerlineish'
-- let g:airline#extensions#branch#enabled = 1
-- let g:airline#extensions#tabline#enabled = 1
-- let g:airline#extensions#ale#enabled = 1
-- let g:airline#extensions#tagbar#enabled = 1
-- let g:airline_skip_empty_sections = 1

-- "*****************************************************************************
-- "" Abbreviations
-- "*****************************************************************************
-- "" no one is really happy until you have this shortcuts
-- cnoreabbrev W! w!
-- cnoreabbrev Q! q!
-- cnoreabbrev Qall! qall!
-- cnoreabbrev Wq wq
-- cnoreabbrev Wa wa
-- cnoreabbrev wQ wq
-- cnoreabbrev WQ wq
-- cnoreabbrev W w
-- cnoreabbrev Q q
-- cnoreabbrev Qall qall

-- "" NERDTree configuration
-- let g:NERDTreeChDirMode=2
-- let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
-- let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
-- let g:NERDTreeShowBookmarks=1
-- let g:nerdtree_tabs_focus_on_files=1
-- let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
-- let g:NERDTreeWinSize = 40
-- set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
-- nnoremap <silent> <F2> :NERDTreeFind<CR>
-- nnoremap <silent> <F3> :NERDTreeToggle<CR>

-- " grep.vim
-- " nnoremap <silent> <leader>f :Rgrep<CR>
-- " let Grep_Default_Options = '-IR'
-- " let Grep_Skip_Files = '*.log *.db'
-- " let Grep_Skip_Dirs = '.git node_modules'

-- " terminal emulation
-- if has('nvim')
--     set splitbelow
--     set splitright
--     tnoremap <Esc> <C-\><C-n>
--     nnoremap <silent><leader>t :vsplit<CR>:term<CR>
--     nnoremap <silent><leader>T :split<CR>:term<CR>
-- else
--     nnoremap <silent><leader>t :bel vert term<CR>
--     nnoremap <silent><leader>T :terminal<CR>
-- endif


-- "*****************************************************************************
-- "" Commands
-- "*****************************************************************************
-- " remove trailing whitespaces
-- command! FixWhitespace :%s/\s\+$//e

-- "*****************************************************************************
-- "" Functions
-- "*****************************************************************************
-- if !exists('*s:setupWrapping')
--   function s:setupWrapping()
--     set wrap
--     set wm=2
--     set textwidth=79
--   endfunction
-- endif

-- "*****************************************************************************
-- "" Autocmd Rules
-- "*****************************************************************************
-- "" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
-- augroup vimrc-sync-fromstart
--   autocmd!
--   autocmd BufEnter * :syntax sync maxlines=200
-- augroup END

-- "" Remember cursor position
-- augroup vimrc-remember-cursor-position
--   autocmd!
--   autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
-- augroup END

-- "" txt
-- augroup vimrc-wrapping
--   autocmd!
--   autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
-- augroup END

-- "" make/cmake
-- augroup vimrc-make-cmake
--   autocmd!
--   autocmd FileType make setlocal noexpandtab
--   autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
-- augroup END

-- set autoread

-- "*****************************************************************************
-- "" Mappings
-- "*****************************************************************************

-- "" Save and Exit (E)
-- nmap <silent><Leader>x :wq<CR>
-- nmap <silent><Leader>º :q!<CR>

-- nmap <silent><Leader>w :w<CR>:call StartifyAtExit()<CR>
-- nmap <silent><Leader>s :w<CR>
-- nmap <silent><Leader>q :call StartifyAtExit()<CR>
-- nmap <silent><Leader>Q :q!<CR>
-- func StartifyAtExit()
--     exec ':bdelete!'
--     if len(getbufinfo({'buflisted':1}))==1 && expand("%")=='' | exec 'Startify'| endif
-- endfunc

-- "" Split
-- noremap <silent><Leader>h :<C-u>split<CR>
-- noremap <silent><Leader>v :<C-u>vsplit<CR>

-- "" EasyMotion (E)
-- nmap <Leader>f <Plug>(easymotion-s2)

-- " Remapea ESC a ii para Salir del Modo Insertar (E)
-- imap ii <Esc>
-- imap II <Esc>
--  "" Desactiva el CapsLock Cuando se está en Insert y se pasa a Normal
--      au InsertLeave * call TurnOffCaps()
--      function TurnOffCaps()
--          if has("unix")
--              let capsState = matchstr(system('xset -q'), '00: Caps Lock:\s\+\zs\(on\|off\)\ze')
--              if capsState == 'on'
--                  silent! execute ':!xdotool key Caps_Lock'
--              endif
--          endif
--      endfunction
--      "" ESCAPE <Esc> ES EQUIVALENTE E <C-C>, pero no lo uso en esta funcion

-- " Agrega una Separación en el Undo (E)
-- inoremap , ,<C-g>u
-- inoremap . .<C-g>u
-- inoremap ! !<C-g>u
-- inoremap ? ?<C-g>u
-- inoremap " "<C-g>u
-- inoremap ; ;<C-g>u

-- "Cambia entre el cursor PARA NVIM
-- let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
-- set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50

-- " Agrega La Posicion del cursor en el JumpList de Vim cuando se mueve más de 5
-- " lineas
-- " nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- " nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
-- " nnoremap <expr> <Up> (v:count > 5 ? "m'" . v:count : "") . '<Up>'
-- " nnoremap <expr> <Down> (v:count > 5 ? "m'" . v:count : "") . '<Down>'

-- "" Window Movement (E)
-- " Objetivo: Saltar entre splits
-- nnoremap <silent><C-Right> <C-w>l
-- nnoremap <silent><C-Left> <C-w>h
-- nnoremap <silent><C-Up> <C-w>k
-- nnoremap <silent><C-Down> <C-w>j

-- "" Window Size (E)
-- nmap <silent><S-k> :res -2<CR>

--  " Cambia el <S-j> a gj. Resuelve el conflicto
--     map <silent><Leader>gj :join<CR>
--         " No me acuerdo que funcion cumple, por eso lo comento
--         " nnoremap <leader>gr mz<leader>gj'z
--     map <silent><Leader>g<S-j> :join!<CR>
--     map <silent><Leader>gq g~

-- nmap <silent><S-j> :res +2<CR>
-- nmap <silent><S-l> :vertical resize +2<CR>
-- nmap <silent><S-h> :vertical resize -2<CR>

-- nmap <silent><S-Up> :res -2<CR>
-- nmap <silent><S-Down> :res +2<CR>
-- nmap <silent><S-Right> :vertical resize +2<CR>
-- nmap <silent><S-Left> :vertical resize -2<CR>

-- "" Change between Capitalization (E)
-- map <silent><Leader>m gu
-- map <silent><Leader><S-m> gU

-- "" Aumenta o Disminuye el valor de un numero (E)
-- map ++ <C-a>
-- map -- <C-x>
-- map ** g<C-a>
-- map __ g<C-x>

-- "" Acomoda el texto de una linea en varias
-- nmap Q gq

-- "" Funciones de CoC
--     ""IR A DONDE SE DECLARO
-- " nmap <silent> gd <Plug>(coc-definition) "" LO REEMPLAZE POR UN QUE DIVIDE LA
--                                           "" PANTALLA A LA MITAD PARA MOSTRARLO
-- nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
--     ""IR A LA COMPLEMENTACIÓN (en lenguaje c no lo soporta)
-- nmap <silent> gi <Plug>(coc-implementation)
--    ""VER UNA LISTA DE LAS UTILIZACIONES DE LA FUNCION
-- nmap <silent> gr <Plug>(coc-references)

-- "" Atajo Sustituir (E)
-- nmap S :%s//g<Left><Left>

-- "" Autocorrector de texto
-- nmap <Leader>o :setlocal spell! spelllang=es_es,en_us<CR>:colorscheme PaperColor<CR>
-- nmap <Leader><S-o> :setlocal spell!<CR>:colorscheme gruvbox<CR>

-- ""Lista de Cambios en un Archivo (E)
-- nmap <Leader>d :DiffSaved<CR>
-- nmap <Leader><S-d> :diffoff<CR>:q<CR>''

-- function! s:DiffWithSaved()
--   let filetype=&ft
--   diffthis
--   vnew | r # | normal! 1Gdd
--   diffthis
--   exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
-- endfunction
-- com! DiffSaved call s:DiffWithSaved()

-- " Autopersonalizacion de la Laptop (E)
-- " if (bufname()==".vimrc")
-- "     nmap ++ gg/" M2017<CR>d$gcc/" M2017<CR>d$gcc/" M2017<CR>d$gcc/" M2017<CR>d$gcc/" M2017<CR>d$gcc:wq<CR>
-- "     nmap ++ gg/" M2017<CR>d$gcc:wq<CR>
-- " endif

-- "" Ordenado Random de Lineas (E)
-- vmap rr !sort -R<CR>

-- "" Para los teclados que no tienen < y >
-- nmap <silent><leader>j :call Programar()<CR>
-- nmap <silent><leader><S-J> :call DesProgramar()<CR>
-- func! Programar()
--     map ç <
--     map Ç >
--     imap ç <
--     imap Ç >
--     map z <
--     map Z >
--     imap z <
--     imap Z >
-- endfunc
-- func! DesProgramar()
--     map z z
--     map Z Z
--     imap z z
--     imap Z Z
--     imap Ç Ç
--     imap ç ç
--     map Ç Ç
--     map ç ç
-- endfunc

-- "" Camina entre los errores (E)
-- map r+ <Plug>(ale_next_wrap)
-- map r- <Plug>(ale_previous_wrap)

-- "" Compile (E)
-- map <Leader>cc :call CompileAndRun()<CR>
-- map <Leader>cx :call Compile()<CR>

-- func! CompileAndRun()
--     exec "w"
--     if &filetype == 'c'
--         exec "!clear && gcc '%' -o '%<'"
--         exec "!clear && time './%<'"
--     elseif &filetype == 'cpp'
--         exec "!clear && g++ '%' -o '%<'"
--         exec "!clear && time './%<'"
--     elseif &filetype == 'rust'
--         exec "!clear && cargo build --manifest-path='%':p:h:h/Cargo.toml"
--         exec "!time cargo run --manifest-path='%':p:h:h/Cargo.toml"
--     elseif &filetype == 'java'
--         exec "!clear && javac '%'"
--         exec "!clear && java '%<'"
--     elseif &filetype == 'sh'
--         exec "!clear && time bash '%'"
--     elseif &filetype == 'python'
--         exec "!clear && time python3 '%'"
--     elseif &filetype == 'javascript'
--         exec "!clear && time node '%'"
--     elseif &filetype == 'html'
--         exec "!chromium '%' &"
--         exec "!firefox '%'"
--         exec "!firefox-esr '%'"
--     elseif &filetype == 'tex'
--         exec "!pdflatex --output-directory='%':p:h '%'"
--     elseif &filetype == 'go'
--         exec "!go build '%<'"
--         exec "!clear && time go run '%'"
--     elseif &filetype == 'text'
--         exec "!clear && echo 'words : ' && wc -w % && echo 'lines : ' && wc -l '%' && echo 'size : ' && du -h '%'"
--     elseif &filetype == 'markdown'
--         exec "!clear && pandoc '%' -o '%<'.pdf && xdg-open '%<'.pdf"
--         exec "!clear && echo 'words : ' && wc -w '%' && echo 'lines : ' && wc -l '%' && echo 'size : ' && du -h '%'"
--     endif
-- endfunc

-- func! Compile()
--     exec "w"
--     if &filetype == 'c'
--         exec "echo expand('%:p:h') | terminal gcc % -o %<"
--     elseif &filetype == 'cpp'
--         exec "echo expand('%:p:h') | terminal g++ % -o %<"
--         exec "normal gg"
--     elseif &filetype == 'java'
--         exec "echo expand('%:p:h') | terminal javac %"
--         exec "normal gg"
--     elseif &filetype == 'rust'
--         exec "echo expand('%:p:h') | terminal cargo build --manifest-path=%:p:h:h/Cargo.toml"
--     elseif &filetype == 'go'
--         exec "echo expand('%:p:h') | terminal go build '%<'"
--     elseif &filetype == 'markdown'
--         exec "!clear && markdown '%' > '%<'.html"
--     endif
-- endfunc

-- "" Git
-- noremap <Leader>ga :Git write<CR>
-- noremap <Leader>gc :Git commit --verbose<CR>
-- noremap <Leader>gp :Git push<CR>
-- noremap <Leader>gll :Git pull<CR>
-- noremap <Leader>gs :G<CR>
-- noremap <Leader>gb :Git blame<CR>
-- noremap <Leader>gdd :Git diff<CR>
-- noremap <Leader>gd :Gvdiffsplit<CR>

-- " session management
-- nnoremap <leader>ks ::SSave<CR>
-- nnoremap <leader>rs :SDelete<CR>

-- "" Tabs and buffers
-- nnoremap <silent><C-t><tab> gt
-- nnoremap <silent><C-t><S-Tab> gT
-- nnoremap <silent><C-t>t :tabnew<CR>:NERDTreeToggle<CR>

-- nnoremap <silent><Tab> :bnext<CR>
-- nnoremap <silent><S-Tab> :bprev<CR>
-- nnoremap <silent><S-t> :enew<CR>:NERDTreeToggle<CR>

--     "" Modifica la posicion del cursor hacia la anterior posición
--     map ca g;
--     "" Modifica la posicion del cursor hacia la siguiente posición
--     map cd g,

-- "" Set working directory
-- nnoremap <leader>. :lcd %:p:h<CR>

-- "" Opens an edit command with the path of the currently edited file filled in
-- noremap <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

-- "" Opens a tab edit command with the path of the currently edited file filled
-- " noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

-- "" Remapea para poder subir o bajar un bloque de texto
-- vmap <S-j> :m '>+1<CR>gv=gv
-- vmap <S-Down> :m '>+1<CR>gv=gv
-- vmap <S-k> :m '<-2<CR>gv=gv
-- vmap <S-Up> :m '<-2<CR>gv=gv

-- "" Remapea el Shift-Y para que copie hasta el final y no toda la linea (E)
-- nnoremap <S-y> y$

-- "" fzf.vim
-- let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95, 'relative': v:true } }
-- set wildmode=list:longest,list:full
-- set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
-- let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

-- " The Silver Searcher
-- if executable('ag')
--   let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
--   set grepprg=ag\ --nogroup\ --nocolor
-- endif

-- " ripgrep
-- if executable('rg')
--   let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
--   set grepprg=rg\ --vimgrep
--   command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
-- endif

-- cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
-- nnoremap <silent> <leader>b :Buffers<CR>
-- nnoremap <silent> <leader>e :Files<CR>
-- nnoremap <silent> <leader>z :FZF -m<CR>

-- "Recovery commands from history through FZF
-- nmap <leader>y :History:<CR>

-- " MARCA DE ROJO los caracteres no ascii que pueden dar problemas en el codigo
-- syntax match nonascii "[^\x00-\x7F]"
-- highlight nonascii guibg=Red ctermbg=2

-- "Startify (pantalla de inicio)
-- let g:webdevicons_enable_startify = 1
-- let g:startify_files_number=8
-- let g:startify_padding_left = 30 " Hard coded padding for lists
-- autocmd User StartifyReady exec 'IndentLinesDisable'
-- autocmd User StartifyAllBufferOpened exec 'IndentLinesEnable'

-- function! s:gitModified()
--     let files = systemlist('git ls-files -m 2>/dev/null')
--     return map(files, "{'line': v:val, 'path': v:val}")
-- endfunction
-- " " same as above, but show untracked files, honouring .gitignore
-- " function! s:gitUntracked()
-- "     let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
-- "     return map(files, "{'line': v:val, 'path': v:val}")
-- " endfunction

-- let g:ascii = [
--             \ '     ___           ___           ___                                      ___     ',
--             \ '    /  /\         /  /\         /  /\          ___            ___        /  /\    ',
--             \ '   /  /::|       /  /::\       /  /::\        /  /\          /__/\      /  /::|   ',
--             \ '  /  /:|:|      /  /:/\:\     /  /:/\:\      /  /:/          \__\:\    /  /:|:|   ',
--             \ ' /  /:/|:|__   /  /::\ \:\   /  /:/  \:\    /  /:/           /  /::\  /  /:/|:|__ ',
--             \ '/__/:/ |:| /\ /__/:/\:\ \:\ /__/:/ \__\:\  /__/:/  ___    __/  /:/\/ /__/:/_|::::\',
--             \ '\__\/  |:|/:/ \  \:\ \:\_\/ \  \:\ /  /:/  |  |:| /  /\  /__/\/:/~~  \__\/  /~~/:/',
--             \ '    |  |:/:/   \  \:\ \:\    \  \:\  /:/   |  |:|/  /:/  \  \::/           /  /:/ ',
--             \ '    |__|::/     \  \:\_\/     \  \:\/:/    |__|:|__/:/    \  \:\          /  /:/  ',
--             \ '    /__/:/       \  \:\        \  \::/      \__\::::/      \__\/         /__/:/   ',
--             \ '    \__\/         \__\/         \__\/           ~~~~                     \__\/    ',
--             \ ' ',
--             \]
-- let g:startify_custom_header=startify#center(g:ascii)

-- let g:startify_bookmarks = [
--       \{'c': '~/.vimrc'},
--       \]

-- " let g:startify_commands = [
--       " \{'s': ['Funcion', 'call Funcion()']},
--       " \]

-- let g:startify_lists = [
--       \ { 'type': 'files',                   'header': startify#pad(['   RECIENTES']        )},
--       \ { 'type': 'sessions',                'header': startify#pad(['   SESIONES']         )},
--       \ { 'type': function('s:gitModified'), 'header': startify#pad(['   GIT - Modificados'])},
--       \ { 'type': 'bookmarks',               'header': startify#pad(['   MARCADORES']       )},
--       \ { 'type': 'commands',                'header': startify#pad(['   COMANDOS']         )},
--       \ ]
--       " \ { 'type': 'dir',                     'header': startify#pad(['   RECIENTES DENTRO DE '. getcwd()]) },
--   " \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
-- "" LO MISMO QUE EL ANTERIOR PERO EN VEZ DE UN TAB ESTÁ CENTRADO
-- " let g:startify_lists = [
-- "       \ { 'type': 'files',                   'header': startify#center(['   RECIENTES'])            },
-- "       \ { 'type': 'dir',                     'header': startify#center(['   DENTRO DE '. getcwd()]) },
-- "       \ { 'type': 'sessions',                'header': startify#center(['   SESIONES'])             },
-- "       \ { 'type': function('s:gitModified'), 'header': startify#center(['   GIT - Modificados'])},
-- "       \ { 'type': 'bookmarks',               'header': startify#center(['   Bookmarks'])            },
-- "       \ ]

-- "Agrega los iconos
-- lua << EOF
-- function _G.webDevIcons(path)
--   local filename = vim.fn.fnamemodify(path, ':t')
--   local extension = vim.fn.fnamemodify(path, ':e')
--   return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
-- end
-- EOF
-- function! StartifyEntryFormat() abort
--   return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
-- endfunction

-- " TagBar (Ctags) para ver clases, metodos, atributos del codigo fuente
-- nmap <F8> :TagbarToggle<CR>

-- " snippets
-- inoremap {<CR> {<CR>}<ESC>O
-- inoremap {;<CR> {<CR>};<ESC>O
-- " Snippets del plugin
-- if(has('python3'))
--     " Use tab for trigger completion with characters ahead and navigate for
--     " Coc-snippets
--     inoremap <silent><expr> <TAB>
--           \ pumvisible() ? coc#_select_confirm() :
--           \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
--           \ <SID>check_back_space() ? "\<TAB>" :
--           \ coc#refresh()
--     function! s:check_back_space() abort
--       let col = col('.') - 1
--       return !col || getline('.')[col - 1]  =~# '\s'
--     endfunction
--     let g:UltiSnipsExpandTrigger='<Nop>'
--     let g:UltiSnipsJumpForwardTrigger = '<TAB>'
--     let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
--     let g:coc_snippet_next = '<TAB>'
--     let g:coc_snippet_prev = '<S-TAB>'
--     let g:UltiSnipsEditSplit="vertical"
--     inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
-- else
--     " Use tab for trigger completion with characters ahead and navigate.
--     " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
--     " other plugin before putting this into your config.
--     inoremap <silent><expr> <TAB>
--     \ pumvisible() ? "\<C-n>" :
--     \ <SID>check_back_space() ? "\<TAB>" :
--     \ coc#refresh()
--     inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
-- endif

-- " ale
-- let g:ale_linters = {}

-- " Tagbar
-- " nmap <silent> <F4> :TagbarToggle<CR> " COMENTADO PORQUE NO FUNCIONA, DA ERROR: tagbar
-- let g:tagbar_autofocus = 1

-- " Disable visualbell
-- set noerrorbells visualbell t_vb=
-- if has('autocmd')
--   autocmd GUIEnter * set visualbell t_vb=
-- endif

-- Copy/Paste/Cut

-- noremap YY "+y<CR>
-- noremap <leader>p "+gP<CR>
-- noremap XX "+x<CR>

-- if has('macunix')
--   " pbcopy for OSX copy/paste
--   vmap <C-x> :!pbcopy<CR>
--   vmap <C-c> :w !pbcopy<CR><CR>
-- endif

-- "" Buffer nav
-- " noremap <leader>z :bp<CR>
-- " noremap <leader>q :bp<CR>
-- " noremap <leader>x :bn<CR>
-- " noremap <leader>w :bn<CR>


-- "" Close buffer
-- " noremap <leader>c :bd<CR>

-- "" Clean search (highlight)
-- nnoremap <silent> <leader><space> :noh<cr>

-- "" Switching windows
-- noremap <C-j> <C-w>j
-- noremap <C-k> <C-w>k
-- noremap <C-l> <C-w>l
-- noremap <C-h> <C-w>h

-- "" Vmap for maintain Visual Mode after shifting > and <
-- vmap < <gv
-- vmap > >gv
-- vmap <S-Right> >gv
-- vmap <S-Left> <gv

-- "" Move visual block
-- vnoremap J :m '>+1<CR>gv=gv
-- vnoremap K :m '<-2<CR>gv=gv

-- "" Open current line on GitHub
-- " nnoremap <Leader>o :.Gbrowse<CR>


-- ""CoC

-- function! s:check_back_space() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction

-- "*****************************************************************************
-- "" Custom configs
-- "*****************************************************************************

-- " c
-- autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
-- autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

-- " ale
-- :call extend(g:ale_linters, {
--     \'python': ['flake8'], })

-- " vim-airline
-- let g:airline#extensions#virtualenv#enabled = 1

-- " Syntax highlight
-- let python_highlight_all = 1



-- "*****************************************************************************
-- "*****************************************************************************

-- "" Include user's local vim config
-- if filereadable(expand("~/.vimrc.local"))
--   source ~/.vimrc.local
-- endif

-- "*****************************************************************************
-- "" Convenience variables
-- "*****************************************************************************

-- " vim-airline
-- if !exists('g:airline_symbols')
--   let g:airline_symbols = {}
-- endif

-- if !exists('g:airline_powerline_fonts')
--   let g:airline#extensions#tabline#left_sep = ' '
--   let g:airline#extensions#tabline#left_alt_sep = '|'
--   " let g:airline_left_sep          = '▶'
--   " let g:airline_left_alt_sep      = '»'
--   " let g:airline_right_sep         = '◀'
--   " let g:airline_right_alt_sep     = '«'
--         let g:airline_left_sep = ''
--         let g:airline_left_alt_sep = ''
--         let g:airline_right_sep = ''
--         let g:airline_right_alt_sep = ''
--   let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
--   let g:airline#extensions#readonly#symbol   = '⊘'
--   let g:airline#extensions#linecolumn#prefix = '¶'
--   let g:airline#extensions#paste#symbol      = 'ρ'
--   " let g:airline_symbols.linenr    = '␊'
--   " let g:airline_symbols.maxlinenr= '☰' "℅
--   let g:airline_symbols.maxlinenr= ' ' "℅
--   let g:airline_symbols.colnr = ' ℅:'
--   " let g:airline_symbols.colnr = ' C:'
--   let g:airline#extensions#battery#enabled = 1
--   let g:airline_symbols.linenr    = ' '
--   " let g:airline_symbols.branch    = '⎇'
--         let g:airline_symbols.branch = ''
--         " let g:airline_symbols.readonly = ''
--         let g:airline_symbols.linenr = ' :'
--   let g:airline_symbols.paste     = 'ρ'
--   let g:airline_symbols.paste     = '∥'
--   let g:airline_symbols.paste     = 'Þ'
--   let g:airline_symbols.whitespace = 'Ξ'
--         let g:airline#extensions#tabline#right_sep = ''
--         let g:airline#extensions#tabline#right_alt_sep = ''
--         let g:airline#extensions#tabline#left_alt_sep = ''
--         let g:airline#extensions#tabline#left_sep = ''
--         let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
--         let g:airline#extensions#tabline#show_tab_nr = 0 " QUITA LOS NUMEROS QUE APARECEN EN LOS TABS, ANULANDO EL tab number
-- else
--   let g:airline#extensions#tabline#left_sep = ''
--   let g:airline#extensions#tabline#left_alt_sep = ''
-- endif


-- "En cuanto al comando time en la funcion de compilar
-- "
-- "     Real is wall clock time - time from start to finish of the call. This is all elapsed time including time slices used by other processes and time the process spends blocked (for example if it is waiting for I/O to complete).

-- "     User is the amount of CPU time spent in user-mode code (outside the kernel) within the process. This is only actual CPU time used in executing the process. Other processes and time the process spends blocked do not count towards this figure.

-- "     Sys is the amount of CPU time spent in the kernel within the process. This means executing CPU time spent in system calls within the kernel, as opposed to library code, which is still running in user-space. Like 'user', this is only CPU time used by the process. See below for a brief description of kernel mode (also known as 'supervisor' mode) and the system call mechanism.
