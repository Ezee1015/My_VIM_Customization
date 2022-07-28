-- Vim-Colorize
  require'colorizer'.setup()

-- NvimTree
  require("nvim-tree").setup ({
    respect_buf_cwd = true,
    view = {
      number = true,
      relativenumber = false,
      adaptive_size = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    renderer = {
      icons = {
        git_placement = "signcolumn"
      },
    },
  })

-- LuaLine
  local function getWords()
    return tostring(vim.fn.wordcount().words)
  end
  function searchCount()
    local search = vim.fn.searchcount({maxcount = 0}) -- maxcount = 0 makes the number not be capped at 99
    local searchCurrent = search.current
    local searchTotal = search.total
    if searchCurrent > 0 then
      return "/"..vim.fn.getreg("/").." ["..searchCurrent.."/"..searchTotal.."]"
    else
      return ""
    end
  end

  require('lualine').setup {
    sections = {
      lualine_x = {{ searchCount }, 'fileformat', 'filetype'},
      lualine_z = {'location', { getWords }}
    },
    extensions = {'nvim-tree'}
  }


-- BufLine
  vim.o.sessionoptions = (vim.o.sessionoptions .. ",globals")
  require('bufferline').setup {
    options = {
      close_command = "call StartifyAtExit()",       -- can be a string | function, see "Mouse actions"
      right_mouse_command = "call StartifyAtExit()", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
      tab_size = 20,
      diagnostics = "coc",
      diagnostics_update_in_insert = false,
      -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count..")"
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "center"
        }
      },
      persist_buffer_sort = true,
      always_show_bufferline = true,
      -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
      --   -- add custom logic
      --   return buffer_a.modified > buffer_b.modified
      -- end
    }
  }

-- IndentLine
  vim.g.indentLine_enabled        = 1
  vim.g.indentLine_concealcursor  = 0
  vim.g.indentLine_char           = '┆'
  vim.g.indentLine_faster         = 1

-- vim-airline
    -- vim.cmd([[
    -- let g:airline#extensions#virtualenv#enabled = 1
    -- let g:airline#extensions#branch#enabled = 1
    -- let g:airline#extensions#tabline#enabled = 1
    -- let g:airline#extensions#ale#enabled = 1
    -- let g:airline#extensions#tagbar#enabled = 1
    -- let g:airline_skip_empty_sections = 1
    -- ""-----------------------------------------------------------
    -- if !exists('g:airline_symbols')
    --   let g:airline_symbols = {}
    -- endif

    -- if !exists('g:airline_powerline_fonts')
    --   let g:airline#extensions#tabline#left_sep = ' '
    --   let g:airline#extensions#tabline#left_alt_sep = '|'
    --   let g:airline_left_sep = ''
    --   let g:airline_left_alt_sep = ''
    --   let g:airline_right_sep = ''
    --   let g:airline_right_alt_sep = ''
    --   let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    --   let g:airline#extensions#readonly#symbol   = '⊘'
    --   let g:airline#extensions#linecolumn#prefix = '¶'
    --   let g:airline#extensions#paste#symbol      = 'ρ'
    --   let g:airline_symbols.maxlinenr= ' ' "℅
    --   let g:airline_symbols.colnr = ' ℅:'
    --   let g:airline#extensions#battery#enabled = 1
    --   let g:airline_symbols.linenr    = ' '
    --   let g:airline_symbols.branch = ''
    --   let g:airline_symbols.linenr = ' :'
    --   let g:airline_symbols.paste     = 'ρ'
    --   let g:airline_symbols.paste     = '∥'
    --   let g:airline_symbols.paste     = 'Þ'
    --   let g:airline_symbols.whitespace = 'Ξ'
    --   let g:airline#extensions#tabline#right_sep = ''
    --   let g:airline#extensions#tabline#right_alt_sep = ''
    --   let g:airline#extensions#tabline#left_alt_sep = ''
    --   let g:airline#extensions#tabline#left_sep = ''
    --   let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
    --   let g:airline#extensions#tabline#show_tab_nr = 0 " QUITA LOS NUMEROS QUE APARECEN EN LOS TABS, ANULANDO EL tab number
    -- else
    --   let g:airline#extensions#tabline#left_sep = ''
    --   let g:airline#extensions#tabline#left_alt_sep = ''
    -- endif
-- ]])

-- Startify
  vim.g.webdevicons_enable_startify = 1
  vim.g.startify_files_number=8
  vim.g.startify_padding_left = 30 -- Hard coded padding for lists
  vim.cmd([[
    autocmd User StartifyReady exec 'IndentLinesDisable'
    autocmd User StartifyAllBufferOpened exec 'IndentLinesEnable'
    function! s:gitModified()
        let files = systemlist('git ls-files -m 2>/dev/null')
        return map(files, "{'line': v:val, 'path': v:val}")
    endfunction
    " " same as above, but show untracked files, honouring .gitignore
    " function! s:gitUntracked()
    "     let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    "     return map(files, "{'line': v:val, 'path': v:val}")
    " endfunction

    let g:ascii = [
                \ '     ___           ___           ___                                      ___     ',
                \ '    /  /\         /  /\         /  /\          ___            ___        /  /\    ',
                \ '   /  /::|       /  /::\       /  /::\        /  /\          /__/\      /  /::|   ',
                \ '  /  /:|:|      /  /:/\:\     /  /:/\:\      /  /:/          \__\:\    /  /:|:|   ',
                \ ' /  /:/|:|__   /  /::\ \:\   /  /:/  \:\    /  /:/           /  /::\  /  /:/|:|__ ',
                \ '/__/:/ |:| /\ /__/:/\:\ \:\ /__/:/ \__\:\  /__/:/  ___    __/  /:/\/ /__/:/_|::::\',
                \ '\__\/  |:|/:/ \  \:\ \:\_\/ \  \:\ /  /:/  |  |:| /  /\  /__/\/:/~~  \__\/  /~~/:/',
                \ '    |  |:/:/   \  \:\ \:\    \  \:\  /:/   |  |:|/  /:/  \  \::/           /  /:/ ',
                \ '    |__|::/     \  \:\_\/     \  \:\/:/    |__|:|__/:/    \  \:\          /  /:/  ',
                \ '    /__/:/       \  \:\        \  \::/      \__\::::/      \__\/         /__/:/   ',
                \ '    \__\/         \__\/         \__\/           ~~~~                     \__\/    ',
                \ ' ',
                \]
    let startify_custom_header=startify#center(g:ascii)

    let g:startify_bookmarks = [
          \{'c': '~/.config/nvim/'},
          \]

    " let g:startify_commands = [
          " \{'s': ['Funcion', 'call Funcion()']},
          " \]

    let g:startify_lists = [
          \ { 'type': 'files',                   'header': startify#pad(['   RECIENTES']        )},
          \ { 'type': 'sessions',                'header': startify#pad(['   SESIONES']         )},
          \ { 'type': function('s:gitModified'), 'header': startify#pad(['   GIT - Modificados'])},
          \ { 'type': 'bookmarks',               'header': startify#pad(['   MARCADORES']       )},
          \ { 'type': 'commands',                'header': startify#pad(['   COMANDOS']         )},
          \ ]
          " \ { 'type': 'dir',                     'header': startify#pad(['   RECIENTES DENTRO DE '. getcwd()]) },
      " \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
    "" LO MISMO QUE EL ANTERIOR PERO EN VEZ DE UN TAB ESTÁ CENTRADO
    " let g:startify_lists = [
    "       \ { 'type': 'files',                   'header': startify#center(['   RECIENTES'])            },
    "       \ { 'type': 'dir',                     'header': startify#center(['   DENTRO DE '. getcwd()]) },
    "       \ { 'type': 'sessions',                'header': startify#center(['   SESIONES'])             },
    "       \ { 'type': function('s:gitModified'), 'header': startify#center(['   GIT - Modificados'])},
    "       \ { 'type': 'bookmarks',               'header': startify#center(['   Bookmarks'])            },
    "       \ ]

    function! StartifyEntryFormat() abort
      return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
    endfunction
    ]])
  -- Agrega los iconos
  function _G.webDevIcons(path)
    local filename = vim.fn.fnamemodify(path, ':t')
    local extension = vim.fn.fnamemodify(path, ':e')
    return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
  end

-- " snippets
  if vim.fn.has('python3') then
    vim.cmd ([[
      function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction
      ]])
    vim.g.UltiSnipsExpandTrigger='<Nop>'
    vim.g.UltiSnipsJumpForwardTrigger = '<TAB>'
    vim.g.UltiSnipsJumpBackwardTrigger = '<S-TAB>'
    vim.g.coc_snippet_next = '<TAB>'
    vim.g.coc_snippet_prev = '<S-TAB>'
    vim.g.UltiSnipsEditSplit="vertical"
    vim.cmd ([[inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"]])
  else
    vim.cmd ([[
      " Use tab for trigger completion with characters ahead and navigate.
      " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
      " other plugin before putting this into your config.
      inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
      inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
      ]])
  end

-- ale
  vim.g.ale_linters = {python= 'flake8' }

-- Tagbar
  vim.g.tagbar_autofocus = 1

-- CoC
vim.cmd ([[
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  ]])
