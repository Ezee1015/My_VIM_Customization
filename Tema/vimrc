set nu rnu
set mouse=a
set cursorline
set showcmd
set encoding=UTF-8
set wildmode=longest,list,full ""Autocompleta Rutas
set ic ""Ignora la Capitalizacion de las letras en la busqueda

set undofile " UnDo persistente, aun cerrando el programa
set undodir=~/.vim/undodir

" Cierre la pestaña si NERDTree es la única ventana que queda en VIM.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"Muestra Numero de Linea en NERDTree
let NERDTreeShowLineNumbers=1

" Open the existing NERDTree on each new tab.
    " let s:Inicio_VIM=0
    " autocmd BufWinEnter * :call AbrirNerdTree()

    " func AbrirNerdTree()
    "     if getcmdwintype() == ''
    " "         if s:Inicio_VIM == 0
    " "             let s:Inicio_VIM=1
    " "         else
    "             NERDTreeToggle
    "         endif
    " "     endif
    " endfunc

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

set clipboard=unnamed " Combina el Portapapeles de VIM con el del Sistema, solo si en ':ver' está +clipboard

let NERDTreeQuitOnOpen=1 " Cierra el NerdTree al abrir un archivo

set lazyredraw " Evita redibujado de ventanas innecesarios, ideal para cuanto se ejecutan macros. Para forzar el redibujado de una ventana, usar el comando :redraw

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"" Cambia entre el cursor cuadrado ( [] ) en modo normal al cursor de barrita ( | ) en el modo de insercion
"" Fuente: https://stackoverflow.com/questions/6488683/how-to-change-the-cursor-between-normal-and-insert-modes-in-vim
    "" Intento 1
        " :autocmd InsertEnter,InsertLeave * set cul!

    "" Intento 2
        " :autocmd InsertEnter * set cul
        " :autocmd InsertLeave * set nocul

    " Intento 3
        let &t_SI = "\e[6 q"
        let &t_EI = "\e[2 q"

        " reset the cursor on start (for older versions of vim, usually not required)
        augroup myCmds
        au!
        autocmd VimEnter * silent !echo -ne "\e[2 q"            "
        augroup END



"""""" SELECT BETWEEN DIFERENTS LANGUAJES
" colorscheme dracula
colorscheme gruvbox
"colorscheme onedark
"colorscheme molokai

set bg=dark

" let g:vim_bootstrap_theme = "dracula"
let g:vim_bootstrap_theme = "gruvbox"
"let g:vim_bootstrap_theme = "onedark"
"let g:vim_bootstrap_theme = "molokai"

" set updatetime=1000 " FRECUENCIA DE ACTUALIZACION DE vim-signify


"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

let g:vim_bootstrap_langs = "c,python"
let g:vim_bootstrap_editor = "vim"				" nvim or vim
let g:vim_bootstrap_frams = ""

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'scrooloose/nerdtree'                         " COMPLEMENTO DE ARBOL DE ARCHIVOS
" Plug 'jistr/vim-nerdtree-tabs'                    " CIERRA NERDTREE. NO ESTA MÁS MANTENIDO, POR ESO LO COMENTO
Plug 'tpope/vim-commentary'                        " PERMITE COMENTAR CON 'gcc'
Plug 'tpope/vim-fugitive'                          " INTEGRACION CON GIT
Plug 'vim-airline/vim-airline'                     " BARRA INFERIOR DE ESTADO CON COLORES
Plug 'vim-airline/vim-airline-themes'              " TEMAS PARA LABARRA INFERIOR DE ESTADO CON COLORES
Plug 'airblade/vim-gitgutter'                      " CONTROL DE CAMBIOS DE UN ARCHIVO
" Plug 'vim-scripts/grep.vim'                      " INTEGRA GREP EN VIM
Plug 'vim-scripts/CSApprox'                        " FUNCION :colorscheme
Plug 'Raimondi/delimitMate'                        " CERRADO AUTOMÁTICO DE PARÉNTESIS, LLAVES, COMILLAS, ETC.
" Plug 'majutsushi/tagbar'                           " ESQUEMA QUE MUESTRA EN UNA LISTA LOS TIPOS DE VARIABLES Y EL NOMBRE DE LAS VARIABLES DECLARADAS. NO FUNCIONA, DA ERROR
Plug 'dense-analysis/ale'                          " MARCA ERRORES DE SYNTAX CON '>>' EN ROJO CON UNA BREVE EXPLICACIÓN.
Plug 'Yggdroot/indentLine'                         " PONE CON ' | ' SEGÚN LOS TABS PARA INDICAR EL CONTENIDO DE UNA ESTRUCTURA
Plug 'editor-bootstrap/vim-bootstrap-updater'      " ACTUALIZADOR DE VIM-BOOTSTRAP
Plug 'tpope/vim-rhubarb'                           " REQUISITO DE fugitive PARA :Gbrowse

Plug 'sheerun/vim-polyglot'                        " HIGHLIGHTNING DE LENGUAJES
Plug 'easymotion/vim-easymotion'                   " MOVERSE MÁS RAPIDO POR VIM CON ',' + 'f'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}    " AUTOCOMPLETADO DE CODIGO
Plug 'Xuyuanp/nerdtree-git-plugin'                 " ASTERISCOS EN NERDTREE CON GIT. no logré que funcione
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " ICONOS DE LOS ARCHIVOS
Plug 'ryanoasis/vim-devicons'                      " ICONOS PARA NERDTREE SINTAX HIGHLIGHT

" if has('nvim') || has('patch-8.0.902')
"   Plug 'mhinz/vim-signify'                         " CONTROL DE VERSIONES DE UN ARCHIVO. CREO QUE NO FUNCIONA, por eso lo comento
" else
"   Plug 'mhinz/vim-signify', { 'branch': 'legacy' } " CONTROL DE VERSIONES DE UN ARCHIVO. CREO QUE NO FUNCIONA, por eso lo comento
" endif




if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'                          " BUSCADOR RAPIDO DE ARCHIVOS
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

" Plug 'Shougo/vimproc.vim', {'do': g:make}          " AYUDA DE LA ESCRITURA EN EL LENGUAJE Oracle Pro*C/C++

"" Vim-Session
Plug 'xolox/vim-misc'                              " LIBRERIA PARA LOS PROGRAMAS DE xolox
Plug 'xolox/vim-session'                           " GESTOR DE SESIONES EN VIM

"" Snippets
"""""""""""""""""" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'                          " SNIPPETS. Ver: https://mkaz.blog/working-with-vim/snippets/

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}    " ESPECIALIZACION EN LENGUAJE C
" Plug 'ludwig/split-manpage.vim'                    " INTEGRACION DE man EN VIM


" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'                        " AUTOCOMPLETACION DE CODIGGO EN PYTHON
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'} " REQUERIMIENTOS DE PYTHON (?)


"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
"colorscheme molokai


set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1


  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif

endif


if &term =~ '256color'
  set t_ut=
endif


"" Disable the blinking cursor.
set gcr=a:blinkon0

set scrolloff=3


"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
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

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 40
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>


"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
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

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Save and Exit (E)
nmap <silent><Leader>x :wq<CR>
nmap <silent><Leader>s :w<CR>
nmap <silent><Leader>º :q!<CR>

nmap <silent><Leader>w :wq<CR>
nmap <silent><Leader>s :w<CR>
nmap <silent><Leader>q :q!<CR>

"" Split
noremap <silent><Leader>h :<C-u>split<CR>
noremap <silent><Leader>v :<C-u>vsplit<CR>

"" EasyMotion (E)
nmap <Leader>f <Plug>(easymotion-s2)

" Remapea ESC a ii para Salir del Modo Insertar (E)
:imap ii <Esc>

"" Window Movement (E)
nnoremap <silent><C-Right> <C-w>l " Objetivo: Saltar entre splits
nnoremap <silent><C-Left> <C-w>h
nnoremap <silent><C-Up> <C-w>k
nnoremap <silent><C-Down> <C-w>j

"" Window Size (E)
nmap <silent><S-k> :res -2<CR>

    map <silent><Leader>gj :join<CR> " Cambia el <S-j> a gj. Resuelve el conflicto
    map <silent><Leader>g<S-j> :join!<CR>
    map <silent><Leader>gq g~

nmap <silent><S-j> :res +2<CR>
nmap <silent><S-l> :vertical resize +2<CR>
nmap <silent><S-h> :vertical resize -2<CR>

nmap <silent><S-Up> :res -2<CR>
nmap <silent><S-Down> :res +2<CR>
nmap <silent><S-Right> :vertical resize +2<CR>
nmap <silent><S-Left> :vertical resize -2<CR>

"" Change between Capitalization (E)
map <silent><Leader>m gu
map <silent><Leader><S-m> gU

"" Aumenta o Disminuye el valor de un numero (E)
map ++ <C-a>
map -- <C-x>

"" Atajo Sustituir (E)
nmap S :%s//g<Left><Left>

"" Autocorrector de texto
nmap <Leader>o :setlocal spell! spelllang=es_es<CR>
nmap <Leader><S-o> :setlocal spell!

""Lista de Cambios en un Archivo (E)
nmap <Leader>d :DiffSaved<CR>
nmap <Leader><S-d> :diffoff<CR>:q<CR>''

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Autopersonalizacion de la Laptop (E)
" if (bufname()==".vimrc")
"     " nmap ++ gg/" M2017<CR>d$gcc/" M2017<CR>d$gcc/" M2017<CR>d$gcc/" M2017<CR>d$gcc/" M2017<CR>d$gcc:wq<CR>
"     nmap ++ gg/" M2017<CR>d$gcc:wq<CR>
" endif

"" Ordenado Random de Lineas (E)
vmap rr !sort -R<CR>

"" Camina entre los errores (E)
map r+ <Plug>(ale_next_wrap)
map r- <Plug>(ale_previous_wrap)

"" Compile (E)
" map <leader>cj /public class<CR>02wyw:!javac <C-R>".java && java <C-R>" <CR>
map <Leader>cc :call CompileAndRun()<CR>

" func! CompileRunGcc()
"   exec "w"
"   exec "!clear && gcc '%' -o '%<'"
"   exec "!clear && './%<'"
" endfunc

" func! CompileRunJava()
"   exec "w"
"   exec "!clear && javac %"
"   exec "!clear && java %<"
" endfunc

func! CompileAndRun()
    exec "w"
    if &filetype == 'c'
        exec "!clear && gcc '%' -o '%<'"
        exec "!clear && time './%<'"
    elseif &filetype == 'cpp'
        exec "!clear && g++ '%' -o '%<'"
        exec "!clear && time './%<'"
    elseif &filetype == 'rust'
        exec "!clear && cargo build --manifest-path='%':p:h:h/Cargo.toml"
        exec "!time cargo run --manifest-path='%':p:h:h/Cargo.toml"
    elseif &filetype == 'java'
    "     exec "!clear && javac '%'"
    "     exec "!clear && time java -cp '%':p:h %:t:r"
        exec "!clear && javac '%'"
        exec "!clear && java '%<'"
    elseif &filetype == 'sh'
        exec "!clear && time bash '%'"
    elseif &filetype == 'python'
        exec "!clear && time python3 '%'"
    elseif &filetype == 'javascript'
        exec "!clear && time node '%'"
    elseif &filetype == 'html'
        exec "!chromium '%' &"
        exec "!firefox '%'"
        exec "!firefox-esr '%'"
    elseif &filetype == 'tex'
        exec "!pdflatex --output-directory='%':p:h '%'"
    elseif &filetype == 'go'
        exec "!go build '%<'"
        exec "!clear && time go run '%'"
    elseif &filetype == 'text'
        exec "!clear && echo 'words : ' && wc -w % && echo 'lines : ' && wc -l '%' && echo 'size : ' && du -h '%'"
    elseif &filetype == 'markdown'
        exec "!clear && echo 'words : ' && wc -w '%' && echo 'lines : ' && wc -l '%' && echo 'size : ' && du -h '%'"
    endif
endfunc



"" Git
noremap <Leader>ga :Git write<CR>
noremap <Leader>gc :Git commit --verbose<CR>
noremap <Leader>gsh :Git push<CR>
noremap <Leader>gll :Git pull<CR>
noremap <Leader>gs :Git status<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Git vdiff<CR>
noremap <Leader>gr :Git remove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <silent><Tab> gt
nnoremap <silent><S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>:NERDTreeToggle<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" " snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" let g:UltiSnipsEditSplit="vertical"

" ale
let g:ale_linters = {}

" Tagbar
" nmap <silent> <F4> :TagbarToggle<CR> " COMENTADO PORQUE NO FUNCIONA, DA ERROR: tagbar
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
" noremap <leader>z :bp<CR>
" noremap <leader>q :bp<CR>
" noremap <leader>x :bn<CR>
" noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
" nnoremap <Leader>o :.Gbrowse<CR>

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" ale
:call extend(g:ale_linters, {
    \'python': ['flake8'], })

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Syntax highlight
let python_highlight_all = 1



"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif




"En cuanto al comando time en la funcion de compilar
"
"     Real is wall clock time - time from start to finish of the call. This is all elapsed time including time slices used by other processes and time the process spends blocked (for example if it is waiting for I/O to complete).

"     User is the amount of CPU time spent in user-mode code (outside the kernel) within the process. This is only actual CPU time used in executing the process. Other processes and time the process spends blocked do not count towards this figure.

"     Sys is the amount of CPU time spent in the kernel within the process. This means executing CPU time spent in system calls within the kernel, as opposed to library code, which is still running in user-space. Like 'user', this is only CPU time used by the process. See below for a brief description of kernel mode (also known as 'supervisor' mode) and the system call mechanism.
