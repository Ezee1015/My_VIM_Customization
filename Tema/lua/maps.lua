-- Map leader to ,
vim.g.mapleader   = ','

map('n', 'n','nzzzv', { noremap= true })
map('n', 'N','Nzzzv', { noremap= true })

-- Abre y cierra folds
map('n', '<Space>','za', {})

-- Save and Exit
vim.cmd ([[
func! StartifyAtExit()
    exec ':bdelete!'
    if len(getbufinfo({'buflisted':1}))==1 && expand("%")=='' | exec 'Startify'| endif
endfunc
]])
map('n', '<leader>w',':w<CR>:call StartifyAtExit()<CR>', { silent= true })
map('n', '<leader>s',':w<CR>', { silent= true })
map('n', '<leader>q',':call StartifyAtExit()<CR>', { silent= true })
map('n', '<leader>Q',':q!<CR>', { silent= true })

-- Split
map('n', '<leader>h',':<C-u>split<CR>', { silent= true, noremap= true })
map('n', '<leader>v',':<C-u>vsplit<CR>', { silent= true, noremap= true })


-- Remapea ESC a ii para Salir del Modo Insertar
map('i', 'ii','<ESC>', {})
map('i', 'Ii','<ESC>', {})
map('i', 'iI','<ESC>', {})
map('i', 'II','<ESC>', {})
-- Desactiva el CapsLock Cuando se está en Insert y se pasa a Normal
vim.cmd([[
  au InsertLeave * call TurnOffCaps()
  function! TurnOffCaps()
    if has("unix")
      let capsState = matchstr(system('xset -q'), '00: Caps Lock:\s\+\zs\(on\|off\)\ze')
      if capsState == 'on'
        silent! execute ':!xdotool key Caps_Lock'
      endif
    endif
  endfunction
  "" ESCAPE <Esc> ES EQUIVALENTE E <C-C>, pero no lo uso en esta funcion
  ]])

-- Agrega una Separación en el Undo
map('i', ',',',<C-g>u', { noremap= true })
map('i', '.','.<C-g>u', { noremap= true })
map('i', '!','!<C-g>u', { noremap= true })
map('i', '?','?<C-g>u', { noremap= true })
map('i', '"','"<C-g>u', { noremap= true })
map('i', ';',';<C-g>u', { noremap= true })

-- Cambia entre el cursor PARA NVIM
vim.cmd([[
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  ]])
--
-- "" Window Movement
map('n', '<C-Right>','<C-w>l', { silent= true, noremap= true })
map('n', '<C-Left>','<C-w>h', { silent= true, noremap= true })
map('n', '<C-Up>','<C-w>k', { silent= true, noremap= true })
map('n', '<C-Down>',':<C-w>l', { silent= true, noremap= true })
map('n', '<C-l>','<C-w>l', { silent= true, noremap= true })
map('n', '<C-h>','<C-w>h', { silent= true, noremap= true })
map('n', '<C-k>','<C-w>k', { silent= true, noremap= true })
map('n', '<C-j>',':res -s <CR>', { silent= true, noremap= true })
  -- Cambia el <S-j> a gj. Resuelve el conflicto
--     map <silent><Leader>gj :join<CR>
--         " No me acuerdo que funcion cumple, por eso lo comento
--         " nnoremap <leader>gr mz<leader>gj'z
--     map <silent><Leader>g<S-j> :join!<CR>
--     map <silent><Leader>gq g~

-- nmap <silent><S-j> :res +2<CR>
-- nmap <silent><S-k> :res -2<CR>
-- nmap <silent><S-l> :vertical resize +2<CR>
-- nmap <silent><S-h> :vertical resize -2<CR>

-- nmap <silent><S-Up> :res -2<CR>
-- nmap <silent><S-Down> :res +2<CR>
-- nmap <silent><S-Right> :vertical resize +2<CR>
-- nmap <silent><S-Left> :vertical resize -2<CR>

-- "" Change between Capitalization
-- map <silent><Leader>m gu
-- map <silent><Leader><S-m> gU

-- "" Aumenta o Disminuye el valor de un numero
-- map ++ <C-a>
-- map -- <C-x>
-- map ** g<C-a>
-- map __ g<C-x>

-- "" Acomoda el texto de una linea en varias
-- nmap Q gq


-- "" Atajo Sustituir
-- nmap S :%s//g<Left><Left>

-- "" Autocorrector de texto
-- nmap <Leader>o :setlocal spell! spelllang=es_es,en_us<CR>:colorscheme PaperColor<CR>
-- nmap <Leader><S-o> :setlocal spell!<CR>:colorscheme gruvbox<CR>

-- ""Lista de Cambios en un Archivo
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

-- "" Ordenado Random de Lineas
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

-- "" Compile
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

-- "" Tabs,  buffers and files
-- nnoremap <silent><C-t><tab> gt
-- nnoremap <silent><C-t><S-Tab> gT
-- nnoremap <silent><C-t>t :tabnew<CR>:NvimTreeToggle<CR>

-- map('n', '<TAB>',':bnext<CR>', { silent= true, noremap= true })
-- map('n', '<S-TAB>',':bprev<CR>', { silent= true, noremap= true })
-- map('n', '<S-t>',':enew<CR>:NvimTreeToggle<CR>', { silent= true, noremap= true })
map('n', '<TAB>'        , ':BufferLineCycleNext<CR>'        , { silent= true, noremap= true } )
map('n', '<S-TAB>'      , ':BufferLineCyclePrev<CR>'        , { silent= true, noremap= true } )
map('n', '<C-b><Right>' , ':BufferLineMoveNext<CR>'         , { silent= true, noremap= true } )
map('n', '<C-b><Left>'  , ':BufferLineMovePrev<CR>'         , { silent= true, noremap= true } )
map('n', '<C-b>e'       , ':BufferLineSortByExtension<CR>'  , { silent= true, noremap= true } )
map('n', '<C-b>d'       , ':BufferLineSortByDirectory<CR>'  , { silent= true, noremap= true } )
map('n', '<S-t>'        , ':enew<CR>:NvimTreeToggle<CR>'    , { silent= true, noremap= true } )

-- cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
-- nnoremap <silent> <leader>b :Buffers<CR>
-- nnoremap <silent> <leader>e :Files<CR>
-- nnoremap <silent> <leader>z :FZF -m<CR>

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

-- "" Remapea el Shift-Y para que copie hasta el final y no toda la linea
-- nnoremap <S-y> y$

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


-- "Recovery commands from history through FZF
-- nmap <leader>y :History:<CR>

-- " Copy/Paste/Cut
-- noremap YY "+y<CR>
-- noremap <leader>p "+gP<CR>
-- noremap XX "+x<CR>

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

-- Terminal en NVim
map('t', '<ESC>','<C-\\><C-n>', { noremap= true })
map('n', '<leader>t',':vsplit<CR>:term<CR>', { silent= true, noremap= true })
map('n', '<leader>T',':split<CR>:term<CR>', { silent= true, noremap= true })

-- "*****************************************************************************
-- "" Mappings de los PLUGINS
-- "*****************************************************************************

-- TagBar (Ctags) para ver clases, metodos, atributos del codigo fuente
  -- nmap <F8> :TagbarToggle<CR>
-- " nmap <silent> <F4> :TagbarToggle<CR> " COMENTADO PORQUE NO FUNCIONA, DA ERROR: tagbar
-- EasyMotion
  map('n', '<leader>f',' <Plug>(easymotion-s2)', {})
-- "" Funciones de CoC
--     ""IR A DONDE SE DECLARO
-- " nmap <silent> gd <Plug>(coc-definition) "" LO REEMPLAZE POR UN QUE DIVIDE LA
--                                           "" PANTALLA A LA MITAD PARA MOSTRARLO
-- nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
--     ""IR A LA COMPLEMENTACIÓN (en lenguaje c no lo soporta)
-- nmap <silent> gi <Plug>(coc-implementation)
--    ""VER UNA LISTA DE LAS UTILIZACIONES DE LA FUNCION
-- nmap <silent> gr <Plug>(coc-references)

-- "" Camina entre los errores
-- map r+ <Plug>(ale_next_wrap)
-- map r- <Plug>(ale_previous_wrap)

-- "" Git
-- noremap <Leader>ga :Git write<CR>
-- noremap <Leader>gc :Git commit --verbose<CR>
-- noremap <Leader>gp :Git push<CR>
-- noremap <Leader>gll :Git pull<CR>
-- noremap <Leader>gs :G<CR>
-- noremap <Leader>gb :Git blame<CR>
-- noremap <Leader>gdd :Git diff<CR>
-- noremap <Leader>gd :Gvdiffsplit<CR>
-- "" Open current line on GitHub
-- " nnoremap <Leader>o :.Gbrowse<CR>

-- " Startify
-- nnoremap <leader>ks ::SSave<CR>
-- nnoremap <leader>rs :SDelete<CR>

-- "" fzf.vim
-- let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95, 'relative': v:true } }
-- set wildmode=list:longest,list:full
-- set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
-- let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

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
--
-- NvimTree
map('n', '<F2>',':NvimTreeFindFileToggle<CR>', { silent= true, noremap= true })
map('n', '<F3>',':NvimTreeToggle<CR>', { silent= true, noremap= true })
