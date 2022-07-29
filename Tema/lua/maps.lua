-- Map leader to ,
vim.g.mapleader   = ','

-- "*****************************************************************************
-- "" Funciones de los Mappings
-- "*****************************************************************************
vim.cmd ([[
  func! StartifyAtExit()
    exec ':bdelete!'
    if len(getbufinfo({'buflisted':1}))==1 && expand("%")=='' | exec 'Startify'| endif
  endfunc
  ]])

-- Desactiva el CapsLock Cuando se está en Insert y se pasa a Normal (Linux-X11)
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

-- Muestra los cambios realizados en el archivo
vim.cmd([[
  function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
  endfunction
  com! DiffSaved call s:DiffWithSaved()
  ]])

-- Programa los cambios de zZçÇ a <><> respectivamente y su restablecimiento
function programar()
  map('n', 'ç', '<', { } )
  map('n', 'Ç', '>', { } )
  map('i', 'ç', '<', { } )
  map('i', 'Ç', '>', { } )
  map('v', 'ç', '<', { } )
  map('v', 'Ç', '>', { } )
  map('n', 'z', '<', { } )
  map('n', 'Z', '>', { } )
  map('i', 'z', '<', { } )
  map('i', 'Z', '>', { } )
  map('v', 'z', '<', { } )
  map('v', 'Z', '>', { } )
end
function desProgramar()
  map('n', 'ç', 'ç', { } )
  map('n', 'Ç', 'Ç', { } )
  map('i', 'ç', 'ç', { } )
  map('i', 'Ç', 'Ç', { } )
  map('v', 'ç', 'ç', { } )
  map('v', 'Ç', 'Ç', { } )
  map('n', 'z', 'z', { } )
  map('n', 'Z', 'Z', { } )
  map('i', 'z', 'z', { } )
  map('i', 'Z', 'Z', { } )
  map('v', 'z', 'z', { } )
  map('v', 'Z', 'Z', { } )
end

-- Compila o Compila y Ejecuta un archivo
function compileAndRun()
  vim.cmd "w"
  if vim.bo.filetype == 'c' then
    vim.cmd "!clear && gcc '%' -o '%<'"
    vim.cmd "!clear && time './%<'"
  elseif vim.bo.filetype == 'cpp' then
    vim.cmd "!clear && g++ '%' -o '%<'"
    vim.cmd "!clear && time './%<'"
  elseif vim.bo.filetype == 'rust' then
    vim.cmd "!clear && cargo build --manifest-path='%':p:h:h/Cargo.toml"
    vim.cmd "!time cargo run --manifest-path='%':p:h:h/Cargo.toml"
  elseif vim.bo.filetype == 'java' then
    vim.cmd "!clear && javac '%'"
    vim.cmd "!clear && java '%<'"
  elseif vim.bo.filetype == 'sh' then
    vim.cmd "!clear && time bash '%'"
  elseif vim.bo.filetype == 'python' then
    vim.cmd "!clear && time python3 '%'"
  elseif vim.bo.filetype == 'javascript' then
    vim.cmd "!clear && time node '%'"
  elseif vim.bo.filetype == 'html' then
    vim.cmd "!chromium '%' &"
    vim.cmd "!firefox '%'"
    vim.cmd "!firefox-esr '%'"
  elseif vim.bo.filetype == 'tex' then
    vim.cmd "!pdflatex --output-directory='%':p:h '%'"
  elseif vim.bo.filetype == 'go' then
    vim.cmd "!go build '%<'"
    vim.cmd "!clear && time go run '%'"
  elseif vim.bo.filetype == 'text' then
    vim.cmd "!clear && echo 'words : ' && wc -w % && echo 'lines : ' && wc -l '%' && echo 'size : ' && du -h '%'"
  elseif vim.bo.filetype == 'markdown' then
    vim.cmd "!clear && pandoc '%' -o '%<'.pdf && xdg-open '%<'.pdf"
    vim.cmd "!clear && echo 'words : ' && wc -w '%' && echo 'lines : ' && wc -l '%' && echo 'size : ' && du -h '%'"
  end
end
function compile()
  vim.cmd "w"
  if vim.bo.filetype == 'c' then
    vim.cmd "echo expand('%:p:h') | terminal gcc % -o %<"
  elseif vim.bo.filetype == 'cpp' then
    vim.cmd "echo expand('%:p:h') | terminal g++ % -o %<"
    vim.cmd "normal gg"
  elseif vim.bo.filetype == 'java' then
    vim.cmd "echo expand('%:p:h') | terminal javac %"
    vim.cmd "normal gg"
  elseif vim.bo.filetype == 'rust' then
    vim.cmd "echo expand('%:p:h') | terminal cargo build --manifest-path=%:p:h:h/Cargo.toml"
  elseif vim.bo.filetype == 'go' then
    vim.cmd "echo expand('%:p:h') | terminal go build '%<'"
  elseif vim.bo.filetype == 'markdown' then
    vim.cmd "!clear && markdown '%' > '%<'.html"
  end
end

-- "*****************************************************************************
-- "" Mappings
-- "*****************************************************************************
map('n', 'n'             , 'nzzzv'                           , { noremap= true }               )
map('n', 'N'             , 'Nzzzv'                           , { noremap= true }               )

-- Abre y cierra folds
map('n', '<Space>'       , 'za'                              , {}                              )

-- Save and Exit
map('n', '<leader>w'     , ':w<CR>:call StartifyAtExit()<CR>', { silent= true }                )
map('n', '<leader>s'     , ':w<CR>'                          , { silent= true }                )
map('n', '<leader>q'     , ':call StartifyAtExit()<CR>'      , { silent= true }                )
map('n', '<leader>Q'     , ':q!<CR>'                         , { silent= true }                )

-- Split
map('n', '<leader>h'     , ':<C-u>split<CR>'                 , { silent= true, noremap= true } )
map('n', '<leader>v'     , ':<C-u>vsplit<CR>'                , { silent= true, noremap= true } )

-- Remapea ESC a ii para Salir del Modo Insertar
map('i', 'ii'            , '<ESC>'                           , {}                              )
map('i', 'Ii'            , '<ESC>'                           , {}                              )
map('i', 'iI'            , '<ESC>'                           , {}                              )
map('i', 'II'            , '<ESC>'                           , {}                              )
-- Agrega una Separación en el Undo
map('i', ','             , ',<C-g>u'                         , { noremap= true }               )
map('i', '.'             , '.<C-g>u'                         , { noremap= true }               )
map('i', '!'             , '!<C-g>u'                         , { noremap= true }               )
map('i', '?'             , '?<C-g>u'                         , { noremap= true }               )
map('i', '"'             , '"<C-g>u'                         , { noremap= true }               )
map('i', ';'             , ';<C-g>u'                         , { noremap= true }               )

-- Window Movement
map('n', '<C-Right>'     , '<C-w>l'                          , { silent= true, noremap= true } )
map('n', '<C-Left>'      , '<C-w>h'                          , { silent= true, noremap= true } )
map('n', '<C-Up>'        , '<C-w>k'                          , { silent= true, noremap= true } )
map('n', '<C-Down>'      , '<C-w>l'                          , { silent= true, noremap= true } )
map('n', '<C-l>'         , '<C-w>l'                          , { silent= true, noremap= true } )
map('n', '<C-h>'         , '<C-w>h'                          , { silent= true, noremap= true } )
map('n', '<C-k>'         , '<C-w>k'                          , { silent= true, noremap= true } )
map('n', '<C-j>'         , '<C-w>l'                          , { silent= true, noremap= true } )

map('n', '<S-Right>'     , ':vertical resize +2<CR>'         , { }                             )
map('n', '<S-Left>'      , ':vertical resize -2<CR>'         , { }                             )
map('n', '<S-Up>'        , ':res -2<CR>'                     , { }                             )
map('n', '<S-Down>'      , ':res +2<CR>'                     , { }                             )
map('n', '<S-l>'         , ':vertical resize +2<CR>'         , { }                             )
map('n', '<S-h>'         , ':vertical resize -2<CR>'         , { }                             )
map('n', '<S-k>'         , ':res -2<CR>'                     , { }                             )
map('n', '<S-j>'         , ':res +2<CR>'                     , { }                             )
-- Cambia el <S-j> a gj. Resuelve el conflicto
map('n', '<leader>gj'    , ':join<CR>'                       , { silent= true }                )
map('n', '<leader>g<S-j>', ':join!<CR>'                      , { silent= true }                )
map('n', '<leader>gq'    , 'g~'                              , { silent= true }                )


-- Change between Capitalization
map('', '<leader>m'     , 'gu'                              , { silent= true }                )
map('', '<leader><S-m>' , 'gU'                              , { silent= true }                )

-- Aumenta o Disminuye el valor de un numero
map('n', '++'            , '<C-a>'                           , { }                             )
map('n', '--'            , '<C-x>'                           , { }                             )
map('n', '**'            , 'g<C-a>'                          , { }                             )
map('n', '__'            , 'g<C-x>'                          , { }                             )

-- Acomoda el texto de una linea en varias
map('n', 'Q'             , 'gq'                              , { }                             )

-- Atajo Sustituir
map('n', 'S'             , ':%s//g<Left><Left>'              , { }                             )

-- Lista de Cambios en un Archivo
map('n', '<leader>d'     , ':DiffSaved<CR>'                  , { }                             )
map('n', '<leader><S-d>' , ":diffoff<CR>:q<CR>''"            , { }                             )

-- Ordenado Random de Lineas
map('v', 'rr'            , '!sort -R<CR>'                    , { }                             )

-- Para los teclados que no tienen < y >
map('n', '<leader>j'     , ':lua Programar()<CR>'            , { silent= true }                )
map('n', '<leader><S-j>' , ':lua desProgramar()<CR>'         , { silent= true }                )

-- Compile
map('n', '<leader>cc'    , ':lua compileAndRun()<CR>'        , { }                             )
map('n', '<leader>c'     , ':lua compile()<CR>'              , { }                             )

-- "" Tabs,  buffers and files
map('n', '<C-t><TAB>'    , 'gt'                              , { silent= true, noremap= true } )
map('n', '<C-t><S-TAB>'  , 'gT'                              , { silent= true, noremap= true } )
map('n', '<C-t>t'        , ':tabnew<CR>:NvimTreeToggle<CR>'  , { silent= true, noremap= true } )

map('n', '<TAB>'         , ':BufferLineCycleNext<CR>'        , { silent= true, noremap= true } )
map('n', '<S-TAB>'       , ':BufferLineCyclePrev<CR>'        , { silent= true, noremap= true } )
map('n', '<C-b><Right>'  , ':BufferLineMoveNext<CR>'         , { silent= true, noremap= true } )
map('n', '<C-b><Left>'   , ':BufferLineMovePrev<CR>'         , { silent= true, noremap= true } )
map('n', '<C-b>e'        , ':BufferLineSortByExtension<CR>'  , { silent= true, noremap= true } )
map('n', '<C-b>d'        , ':BufferLineSortByDirectory<CR>'  , { silent= true, noremap= true } )
map('n', '<S-t>'         , ':enew<CR>:NvimTreeToggle<CR>'    , { silent= true, noremap= true } )

map('c', '<C-r>p'        , '<C-R>=expand("%:p:h") . "/" <CR>', { noremap= true }               )

-- Modifica la posicion del cursor hacia la anterior o siguiente posición
map('n', 'cs'            , 'g;'                              , { noremap= true }               )
map('n', 'cd'            , 'g,'                              , { noremap= true }               )

-- Set working directory
map('n', '<leader>.'     , ':lcd %:p:h<CR>'                  , { silent= true, noremap= true } )

-- Remapea para poder subir o bajar un bloque de texto
map('v', '<S-Up>'        , ":m '<-2<CR>gv=gv"                , { noremap= true }               )
map('v', '<S-Down>'      , ":m '>+1<CR>gv=gv"                , { noremap= true }               )
map('v', '<S-k>'         , ":m '<-2<CR>gv=gv"                , { noremap= true }               )
map('v', '<S-j>'         , ":m '>+1<CR>gv=gv"                , { noremap= true }               )

-- Remapea el Shift-Y para que copie hasta el final y no toda la linea
map('n', '<S-y>'         , 'y$'                              , { noremap= true }               )

-- Clean search (highlight)
map('n', '<leader><space>', ':noh<CR>'                       , { silent= true, noremap= true } )

-- Vmap for maintain Visual Mode after shifting < and >
map('v', '<'             , '<gv'                             , { }                             )
map('v', '>'             , '>gv'                             , { }                             )
-- Vmap for Shift and horizontal movement to do shifting < and >
map('v', '<S-Right>'     , '>gv'                             , { }                             )
map('v', '<S-Left>'      , '<gv'                             , { }                             )
map('v', '<S-l>'         , '>gv'                             , { }                             )
map('v', '<S-h>'         , '<gv'                             , { }                             )

-- Terminal en NVim
map('t', '<ESC>'         , '<C-\\><C-n>'                     , { noremap= true }               )
map('n', '<leader>t'     , ':vsplit<CR>:term<CR>'            , { silent= true, noremap= true } )
map('n', '<leader>T'     , ':split<CR>:term<CR>'             , { silent= true, noremap= true } )

-- "*****************************************************************************
-- "" Mappings de los PLUGINS
-- "*****************************************************************************

-- TagBar (Ctags)
map('n', '<F8>'          , ':TagbarToggle<CR>'               , { silent= true }                )

-- EasyMotion
map('n', '<leader>f'     , ' <Plug>(easymotion-s2)'          , { }                             )

-- CoC
  -- LO REEMPLAZE POR UN QUE DIVIDE LA PANTALLA A LA MITAD PARA MOSTRARLO
--nmap <silent> gd <Plug>(coc-definition)
  -- IR A LA COMPLEMENTACIÓN (en lenguaje c no lo soporta)
--nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
  -- VER UNA LISTA DE LAS UTILIZACIONES DE LA FUNCION
--nmap <silent> gi <Plug>(coc-implementation)
--nmap <silent> gr <Plug>(coc-references)

-- Camina entre los errores
map('n', 'e+'            , '<Plug>(ale_next_wrap)'           , { silent= true }                )
map('n', 'e-'            , '<Plug>(ale_previous_wrap)'       , { silent= true }                )

-- Git
map('n', '<leader>ga'    , ':Git write<CR>'                  , { noremap= true }               )
map('n', '<leader>gc'    , ':Git commit --verbose<CR>'       , { noremap= true }               )
map('n', '<leader>gp'    , ':Git push<CR>'                   , { noremap= true }               )
map('n', '<leader>gl'    , ':Git pull<CR>'                   , { noremap= true }               )
map('n', '<leader>gs'    , ':G<CR>'                          , { noremap= true }               )
map('n', '<leader>gb'    , ':Git blame<CR>'                  , { noremap= true }               )
map('n', '<leader>gd'    , ':Gvdiffsplit<CR>'                , { noremap= true }               )

-- Startify
map('n', '<leader>ks'    , ':SSave<CR>'                      , { noremap= true }               )
map('n', '<leader>rs'    , ':SDelete<CR>'                    , { noremap= true }               )

-- Snippets
map('i', '{<CR>'         , '{<CR>}<ESC>O'                    , { noremap= true }               )
map('i', '{;<CR>'        , '{<CR>};<ESC>O'                   , { noremap= true }               )

-- NvimTree
map('n', '<F2>'         , ':NvimTreeFindFileToggle<CR>'      , { silent= true, noremap= true } )
map('n', '<F3>'         , ':NvimTreeToggle<CR>'              , { silent= true, noremap= true } )

-- Telescope.nvim
map('n', '<leader>e'    , "<cmd>lua require('telescope.builtin').find_files()<cr>", { silent= true, noremap= true })
map('n', '<leader>r'    , "<cmd>lua require('telescope.builtin').live_grep()<cr>" , { silent= true, noremap= true })
map('n', '<leader>b'    , "<cmd>lua require('telescope.builtin').buffers()<cr>"   , { silent= true, noremap= true })
map('n', '<leader>fh'   , "<cmd>lua require('telescope.builtin').help_tags()<cr>" , { silent= true, noremap= true })
map('n', '<leader>y'    , ":lua require'telescope.builtin'.search_history{}<CR>"  , { noremap= true }              )

-- Snippets del plugin
vim.cmd([[
  if(has('python3'))
      inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : Check_back_space() ? "\<TAB>" : coc#refresh()
    function! Check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
  else
      inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : Check_back_space() ? "\<TAB>" : coc#refresh()
  endif
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  ]])
-- Tuve que sacarle el <SID> a dos lineas porque no funciona con lua. Linea original:
--     \ <SID>check_back_space() ? "\<TAB>" :
