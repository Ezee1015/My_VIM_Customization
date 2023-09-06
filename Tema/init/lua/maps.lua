-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader   = ' '

-- "*****************************************************************************
-- "" Funciones de los Mappings
-- "*****************************************************************************

local function isBufferEmptyAndNotSaved()
  local buffer_number = vim.fn.bufnr('%')
  local is_modified = vim.fn.getbufvar(buffer_number, '&modified')

  if is_modified == 0 then
    local line_count = vim.fn.line('$')
    return line_count == 1 and vim.fn.empty(vim.fn.getline(1)) == 1
  end
  return false
end

function StartifyAtExit()
  -- Si existe una segunda ventana (no solo una)
  local success, _ = pcall(vim.cmd, 'close!')

  if not success then
    vim.cmd(':bdelete!')

    if isBufferEmptyAndNotSaved() then
      vim.cmd(':bdelete!')
      vim.cmd('Startify')
    end
  end

  -- if vim.fn.winbufnr(2) ~= -1 then
  --   exec(':silent! close!', false)
  -- else
  --   exec(':bdelete!', false)
  --
  --
  -- if isBufferEmptyAndNotSaved() then
  --   exec(':bdelete!', false)
  --   exec('Startify', false)
  -- end

  -- end
end

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
end
function DesProgramar()
  map('n', 'ç', 'ç', { } )
  map('n', 'Ç', 'Ç', { } )
  map('i', 'ç', 'ç', { } )
  map('i', 'Ç', 'Ç', { } )
  map('v', 'ç', 'ç', { } )
  map('v', 'Ç', 'Ç', { } )
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
map('n', '<leader>w'     , ':w<CR>:lua StartifyAtExit()<CR>' , { silent= true }                )
map('n', '<leader>s'     , ':w<CR>'                          , { silent= true }                )
map('n', '<leader>q'     , ':lua StartifyAtExit()<CR>'       , { silent= true }                )
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

-- Maximiza y Restaurar una ventana
map('n', '<leader>o'     , '<C-w>='                          , { silent= true, noremap= true } )
map('n', '<leader>O'     , '<C-w>|<C-W>_'                    , { silent= true, noremap= true } )

-- Junta y divide lineas
map('n', 'Q'             , 'gq'                              , { }                             )
map('n', '<leader>j'    , ':join<CR>'                        , { silent= true }                )
map('n', '<leader><S-j>', ':join!<CR>'                       , { silent= true }                )
map('v', '<leader>j'    , ':join<CR>'                        , { silent= true }                )
map('v', '<leader><S-j>', ':join!<CR>'                       , { silent= true }                )

-- DiffPut en varias lineas (Visual-Mode)
map('v', 'Dp'           , ':diffput<CR>'                     , { silent= true, noremap= true } )

-- Change between Capitalization
map('', '<leader>m'     , 'gu'                               , { silent= true }                )
map('', '<leader><S-m>' , 'gU'                               , { silent= true }                )
map('', '<leader>gq'    , 'g~'                               , { silent= true }                )

-- Aumenta o Disminuye el valor de un numero
map('', '++'            , '<C-a>'                           , { }                             )
map('', '--'            , '<C-x>'                           , { }                             )
map('', '**'            , 'g<C-a>'                          , { }                             )
map('', '__'            , 'g<C-x>'                          , { }                             )

-- Atajo Sustituir
map('n', 'S'             , ':%s//g<Left><Left>'              , { }                             )
map('n', '<Leader>S'     , ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>' , { }        )

-- Lista de Cambios en un Archivo
map('n', '<F6>'          , ':DiffSaved<CR>'                  , { }                             )
map('n', '<F7>'          , ":diffoff<CR>:q<CR>''"            , { }                             )

-- Ordenado Random de Lineas
map('v', 'rr'            , '!sort -R<CR>'                    , { }                             )

-- Para los teclados que no tienen < y >
map('n', '<leader>ç'     , ':lua Programar()<CR>'            , { silent= true }                )
map('n', '<leader>Ç'     , ':lua DesProgramar()<CR>'         , { silent= true }                )

-- Compile
map('n', '<leader>cc'    , ':lua Procesar("ejecutar")<CR>'   , { }                             )
map('n', '<leader>c'     , ':lua Procesar("compilar")<CR>'   , { }                             )

-- "" Tabs,  buffers and files
map('n', '<C-t><TAB>'    , 'gt'                              , { silent= true, noremap= true } )
map('n', '<C-t><S-TAB>'  , 'gT'                              , { silent= true, noremap= true } )
map('n', '<C-t>t'        , ':tabnew<CR>:NvimTreeToggle<CR>'  , { silent= true, noremap= true } )

-- Permite ingresar la ruta actual de la carpeta
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

-- Surround ([{*"'` `'"*}])
map('v', '('    , 's()<ESC>P'                                , { silent= true, noremap= true } )
map('v', ')'    , 's(  )<ESC>hP'                             , { silent= true, noremap= true } )
map('v', '['    , 's[]<ESC>P'                                , { silent= true, noremap= true } )
map('v', ']'    , 's[  ]<ESC>hP'                             , { silent= true, noremap= true } )
map('v', '{'    , 's{}<ESC>P'                                , { silent= true, noremap= true } )
map('v', '}'    , 's{  }<ESC>hP'                             , { silent= true, noremap= true } )
map('v', '"'    , 's""<ESC>P'                                , { silent= true, noremap= true } )
map('v', '\''    , 's\'\'<ESC>P'                             , { silent= true, noremap= true } )
map('v', '`'    , 's``<ESC>P'                                , { silent= true, noremap= true } )
map('v', '*'    , 's**<ESC>P'                                , { silent= true, noremap= true } )

-- "*****************************************************************************
-- "" Mappings de los PLUGINS
-- "*****************************************************************************

-- TagBar (Ctags)
map('n', '<F8>'          , ':TagbarToggle<CR>'               , { silent= true }                )

-- Startify
map('n', '<leader>ks'    , ':SSave<CR>'                      , { noremap= true }               )
map('n', '<leader>rs'    , ':SDelete<CR>'                    , { noremap= true }               )

-- Snippets
-- map('i', '{<CR>'         , '{<CR>}<ESC>O'                    , { noremap= true }               )
map('i', '{;<CR>'        , '{<CR>};<ESC>O'                   , { noremap= true }               )

-- LSP NVIM
map('n', '<leader>e'    , '<cmd>lua vim.diagnostic.open_float()<CR>'              , { silent= true, noremap= true } )
map('n', '-e'           , '<cmd>lua vim.diagnostic.goto_prev()<CR>'               , { silent= true, noremap= true } )
map('n', '+e'           , '<cmd>lua vim.diagnostic.goto_next()<CR>'               , { silent= true, noremap= true } )
map('n', '<leader>dr'   , '<cmd>lua vim.lsp.buf.rename()<CR>'                     , { silent= true, noremap= true } )
-- Reemplazado por Telescope
-- map('n', 'gd'           , '<cmd>lua vim.lsp.buf.definition()<CR>'                 , { silent= true, noremap= true } )

-- UndoTree
map('n', '<F5>'         , ':UndotreeToggle<CR>'                , { noremap= true }               )

-- Terminal
map('t', '<ESC>'        , '<C-\\><C-n>'                        , { noremap= true }               )
map('t', 'ii'           , '<C-\\><C-n>'                        , { noremap= true }               )

-- Markdown
map('n', '<leader>toc'  , 'gg:GenTocGFM<CR>'                   , { noremap= true }               )
