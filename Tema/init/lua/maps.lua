-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- Map leader to ,
-- vim.g.mapleader   = ','
vim.g.mapleader   = ' '

-- "*****************************************************************************
-- "" Funciones de los Mappings
-- "*****************************************************************************
vim.cmd ([[
  func! StartifyAtExit()
    exec ':TSContextToggle'
    if (tabpagewinnr(tabpagenr(), '$') > 1 )
      exec ':silent! close!'
    else
      exec ':bdelete!'
    endif
    exec ':TSContextToggle'
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
function Programar()
  map('n', 'ç', '<', { } )
  map('n', 'Ç', '>', { } )
  map('i', 'ç', '<', { } )
  map('i', 'Ç', '>', { } )
  map('v', 'ç', '<', { } )
  map('v', 'Ç', '>', { } )
  -- map('n', 'z', '<', { } )
  -- map('n', 'Z', '>', { } )
  -- map('i', 'z', '<', { } )
  -- map('i', 'Z', '>', { } )
  -- map('v', 'z', '<', { } )
  -- map('v', 'Z', '>', { } )
end
function DesProgramar()
  map('n', 'ç', 'ç', { } )
  map('n', 'Ç', 'Ç', { } )
  map('i', 'ç', 'ç', { } )
  map('i', 'Ç', 'Ç', { } )
  map('v', 'ç', 'ç', { } )
  map('v', 'Ç', 'Ç', { } )
  -- map('n', 'z', 'z', { } )
  -- map('n', 'Z', 'Z', { } )
  -- map('i', 'z', 'z', { } )
  -- map('i', 'Z', 'Z', { } )
  -- map('v', 'z', 'z', { } )
  -- map('v', 'Z', 'Z', { } )
end


-- "*****************************************************************************
-- "" Mappings
-- "*****************************************************************************
map('n', 'n'             , 'nzzzv'                           , { noremap= true }               )
map('n', 'N'             , 'Nzzzv'                           , { noremap= true }               )

-- Elimina en el void
map('n', '<leader>d'     , '"_d'                             , {}                              )
map('v', '<leader>d'     , '"_d'                             , {}                              )

-- Abre y cierra folds
-- map('n', '<Space>'       , 'za'                              , {}                              )

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
map('n', '<C-j>'         , '<C-w>j'                          , { silent= true, noremap= true } )

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
map('', '<leader>m'     , 'gu'                               , { silent= true }                )
map('', '<leader><S-m>' , 'gU'                               , { silent= true }                )

-- Aumenta o Disminuye el valor de un numero
map('n', '++'            , '<C-a>'                           , { }                             )
map('n', '--'            , '<C-x>'                           , { }                             )
map('n', '**'            , 'g<C-a>'                          , { }                             )
map('n', '__'            , 'g<C-x>'                          , { }                             )
map('v', '++'            , '<C-a>'                           , { }                             )
map('v', '--'            , '<C-x>'                           , { }                             )
map('v', '**'            , 'g<C-a>'                          , { }                             )
map('v', '__'            , 'g<C-x>'                          , { }                             )

-- Acomoda el texto de una linea en varias
map('n', 'Q'             , 'gq'                              , { }                             )

-- Atajo Sustituir
map('n', 'S'             , ':%s//g<Left><Left>'              , { }                             )
map('n', '<Leader>S'     , ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>' , { }        )

-- Lista de Cambios en un Archivo
map('n', '<F6>'          , ':DiffSaved<CR>'                  , { }                             )
map('n', '<F7>'          , ":diffoff<CR>:q<CR>''"            , { }                             )

-- Ordenado Random de Lineas
map('v', 'rr'            , '!sort -R<CR>'                    , { }                             )

-- Para los teclados que no tienen < y >
map('n', '<leader>j'     , ':lua Programar()<CR>'            , { silent= true }                )
map('n', '<leader><S-j>' , ':lua DesProgramar()<CR>'         , { silent= true }                )

-- Compile
map('n', '<leader>cc'    , ':lua Procesar("ejecutar")<CR>'   , { }                             )
map('n', '<leader>c'     , ':lua Procesar("compilar")<CR>'   , { }                             )

-- "" Tabs,  buffers and files
map('n', '<C-t><TAB>'    , 'gt'                              , { silent= true, noremap= true } )
map('n', '<C-t><S-TAB>'  , 'gT'                              , { silent= true, noremap= true } )
map('n', '<C-t>t'        , ':tabnew<CR>:NvimTreeToggle<CR>'  , { silent= true, noremap= true } )

map('n', '<TAB>'         , ':BufferLineCycleNext<CR>'        , { silent= true, noremap= true } )
map('n', '<S-TAB>'       , ':BufferLineCyclePrev<CR>'        , { silent= true, noremap= true } )
map('n', '<S-t>'         , ':enew<CR>:NvimTreeToggle<CR>'    , { silent= true, noremap= true } )
map('n', '<C-b><Right>'  , ':BufferLineMoveNext<CR>'         , { silent= true, noremap= true } )
map('n', '<C-b><Left>'   , ':BufferLineMovePrev<CR>'         , { silent= true, noremap= true } )
map('n', '<C-b>e'        , ':BufferLineSortByExtension<CR>'  , { silent= true, noremap= true } )
map('n', '<C-b>d'        , ':BufferLineSortByDirectory<CR>'  , { silent= true, noremap= true } )
map('n', '<leader>1'     , ':BufferLineGoToBuffer 1<CR>'     , { silent= true, noremap= true } )
map('n', '<leader>2'     , ':BufferLineGoToBuffer 2<CR>'     , { silent= true, noremap= true } )
map('n', '<leader>3'     , ':BufferLineGoToBuffer 3<CR>'     , { silent= true, noremap= true } )
map('n', '<leader>4'     , ':BufferLineGoToBuffer 4<CR>'     , { silent= true, noremap= true } )
map('n', '<leader>5'     , ':BufferLineGoToBuffer 5<CR>'     , { silent= true, noremap= true } )
map('n', '<leader>6'     , ':BufferLineGoToBuffer 6<CR>'     , { silent= true, noremap= true } )
map('n', '<leader>7'     , ':BufferLineGoToBuffer 7<CR>'     , { silent= true, noremap= true } )
map('n', '<leader>8'     , ':BufferLineGoToBuffer 8<CR>'     , { silent= true, noremap= true } )
map('n', '<leader>9'     , ':BufferLineGoToBuffer 9<CR>'     , { silent= true, noremap= true } )
map('n', '<leader>0'     , ':BufferLineGoToBuffer 10<CR>'    , { silent= true, noremap= true } )

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
map('n', '<leader>,', ':noh<CR>'                             , { silent= true, noremap= true } )

-- Vmap for maintain Visual Mode after shifting < and >
map('v', '<'             , '<gv'                             , { }                             )
map('v', '>'             , '>gv'                             , { }                             )
-- Vmap for Shift and horizontal movement to do shifting < and >
map('v', '<S-Right>'     , '>gv'                             , { }                             )
map('v', '<S-Left>'      , '<gv'                             , { }                             )
map('v', '<S-l>'         , '>gv'                             , { }                             )
map('v', '<S-h>'         , '<gv'                             , { }                             )

-- Hace que pegar sobre una seleccion no reemplaze a lo que se borra
map('v', '<leader>p'    , '"_dP'                             , { silent= true, noremap= true } )

-- Marca de rojo los caracteres no ascii que pueden dar problemas en el código
map('n', '<leader>i'    , ':syntax match nonascii "[^\\d0-\\d127]"<CR>:highlight nonascii guibg=DarkRed ctermbg=2<CR>' , { silent= true, noremap= true } )

-- "*****************************************************************************
-- "" Mappings de los PLUGINS
-- "*****************************************************************************

-- TagBar (Ctags)
map('n', '<F8>'          , ':TagbarToggle<CR>'               , { silent= true }                )

-- EasyMotion
map('n', '<leader>f'     , ' <Plug>(easymotion-s2)'          , { }                             )

-- Git
map('n', '<leader>ga'    , ':Git write<CR>'                  , { noremap= true }               )
map('n', '<leader>gc'    , ':Git commit --verbose<CR>'       , { noremap= true }               )
map('n', '<leader>gp'    , ':Git push<CR>'                   , { noremap= true }               )
map('n', '<leader>gl'    , ':Git pull<CR>'                   , { noremap= true }               )
map('n', '<leader>gs'    , ':G<CR>'                          , { noremap= true }               )
map('n', '<leader>gb'    , ':Git blame<CR>'                  , { noremap= true }               )
map('n', '<leader>gd'    , ':Gvdiffsplit<CR>'                , { noremap= true }               )
map('n', '<leader>gb'    , ':Gitsigns blame_line<CR>'                , { noremap= true }               )

-- Startify
map('n', '<leader>ks'    , ':SSave<CR>'                      , { noremap= true }               )
map('n', '<leader>rs'    , ':SDelete<CR>'                    , { noremap= true }               )

-- Snippets
-- map('i', '{<CR>'         , '{<CR>}<ESC>O'                    , { noremap= true }               )
map('i', '{;<CR>'        , '{<CR>};<ESC>O'                   , { noremap= true }               )

-- NvimTree
map('n', '<F2>'         , ':NvimTreeFindFileToggle<CR>'      , { silent= true, noremap= true } )
map('n', '<F3>'         , ':NvimTreeToggle<CR>'              , { silent= true, noremap= true } )

-- Telescope.nvim
map('n', '<leader>rr'   , "<cmd>lua require('telescope.builtin').find_files()<cr>"   , { silent= true, noremap= true } )
map('n', '<leader>rc'   , "<cmd>Telescope neoclip defualt<CR>"                       , { silent= true, noremap= true } )
map('n', '<leader>rf'   , "<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>" , { silent= true, noremap= true } )
map('n', '<leader>r'    , "<cmd>lua require('telescope.builtin').live_grep()<cr>"    , { silent= true, noremap= true } )
map('n', '<leader>b'    , "<cmd>lua require('telescope.builtin').buffers()<cr>"      , { silent= true, noremap= true } )
map('n', '<leader>y'    , "<cmd>lua require'telescope.builtin'.search_history{}<CR>" , { noremap= true }               )
map('n', '<leader>gt'   , "<cmd>lua require('telescope.builtin').help_tags()<cr>"    , { silent= true, noremap= true } )
map('n', '<leader>z'    , "<cmd>lua require('telescope.builtin').spell_suggest()<cr>"                      , { silent= true, noremap= true } )
-- map('n', '<leader>gi'   , "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>" , { silent= true, noremap= true } )
map('n', '<leader>gr'   , "<cmd>lua require('telescope.builtin').lsp_references()<cr>" , { silent= true, noremap= true } )
map('n', '<leader>dk'   , "<cmd>lua require('telescope.builtin').keymaps()<cr>"      , { silent= true, noremap= true } )
map('n', '<leader>dt'   , "<cmd>lua require('telescope.builtin').treesitter()<cr>"   , { silent= true, noremap= true } )
-- NeoClip Telescope
map('n', '<leader>dc'   , "<cmd>lua require('telescope').extensions.neoclip.default()<CR>"    , { silent= true, noremap= true } )
map('n', '<leader>dq'   , "<cmd>lua require('telescope').extensions.macroscope.default()<CR>" , { silent= true, noremap= true } )

-- LSP NVIM
map('n', '<leader>e'    , '<cmd>lua vim.diagnostic.open_float()<CR>'              , { silent= true, noremap= true } )
map('n', '-e'           , '<cmd>lua vim.diagnostic.goto_prev()<CR>'               , { silent= true, noremap= true } )
map('n', '+e'           , '<cmd>lua vim.diagnostic.goto_next()<CR>'               , { silent= true, noremap= true } )
map('n', '<leader>dd'   , '<cmd>Telescope diagnostics<CR>'                        , { silent= true, noremap= true } )
map('n', '<leader>dr'   , '<cmd>lua vim.lsp.buf.rename()<CR>'                     , { silent= true, noremap= true } )
map('n', 'gd'           , '<cmd>lua vim.lsp.buf.definition()<CR>'                 , { silent= true, noremap= true } )

-- UndoTree
map('n', '<F5>'         , ':UndotreeToggle<CR>'              , { noremap= true }               )

-- ZenMode
map('n', '<leader>x'    , ":ZenMode<CR>"                      , { silent= true, noremap= true } )

-- Terminal en NVim
map('n', '<leader>t'     , ':ToggleTerm direction=float<CR>'    , { silent= true, noremap= true } )
map('n', '<leader>T'     , ':ToggleTerm direction=vertical<CR>' , { silent= true, noremap= true } )
map('t', '<ESC>'         , '<C-\\><C-n>'                     , { noremap= true }               )
map('t', 'ii'            , '<C-\\><C-n>'                     , { noremap= true }               )
