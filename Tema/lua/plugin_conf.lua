          -- alalalalallala
-- Vim-Colorize
  require'colorizer'.setup()

-- NvimTree
  require("nvim-tree").setup ({
    respect_buf_cwd = true,
    view = {
      number = true,
      relativenumber = true,
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
  -- Total de Palabras en el archivo
  local function getWords() return "\u{23B5} "..tostring(vim.fn.wordcount().words) end
  -- Muestra la palabra de la busqueda y sus conincidencias: /zzzzzz [xx/xx]
  local function searchCount()
    local search = vim.fn.searchcount({maxcount = 0}) -- maxcount = 0 makes the number not be capped at 99
    local searchCurrent = search.current
    local searchTotal = search.total
    if searchCurrent > 0 and vim.v.hlsearch ~= 0 then
      return "/"..vim.fn.getreg("/").." ["..searchCurrent.."/"..searchTotal.."]"
    end
    return ""
  end
  -- Is a Function that formats the time() function indicator...
  -- If the hour or the minutes is less than 10, it completes with a '0' on the right
  -- in order to have always the same width and to improve visibility
  function formatTime(value)
    if value < 10 then
      return '0'..value
    end
    return value
  end
  -- Shows a clock in the statusline
  local function time()
    local unixTime = os.time()
    -- local seconds  = formatTime(unixTime % 60) -- UNCOMENT TO ENABLE SECONDS. Restart NeoVim in order to work properly
    local minutes  = formatTime(math.floor(unixTime%3600/60))
    local hours    = formatTime(math.floor(unixTime%86400/3600))
    local timezone = -3 -- Argentina GMT-3
    -- Apply Timezone
    hours     = hours + timezone
    if hours <= 0 then
      hours   = 24 + hours
    end

    if seconds == nil then
      return "\u{f64f} "..hours..":"..minutes
    end
    return "\u{f64f} "..hours..":"..minutes..":"..seconds
  end

  require('lualine').setup {
    options = {
      refresh = {
        statusline = 500,
      }
    },
    sections = {
      lualine_x = {{ searchCount }, 'fileformat', 'filetype'},
      lualine_y = {'progress','location', },
      lualine_z = {{ getWords },{ time }}
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
-- Telescope
  local actions = require "telescope.actions"
  require('telescope').setup{
    defaults = {
      -- layout_strategy = 'vertical',
      layout_strategy = 'horizontal',
      layout_config = {
        height = 0.99,
        width = 0.99,
        preview_cutoff = 50,
        horizontal = {
          preview_width = function(_, cols, _)
            if cols > 200 then
              return math.floor(cols * 0.4)
            else
              return math.floor(cols * 0.6)
            end
          end,
        },
        vertical = { width = 0.9, height = 0.95, preview_height = 0.5 },
      },
      mappings = {
        i = {
          ["<ESC>"] = actions.close
        }
      },
    }
  }

-- IndentLine
  vim.g.indentLine_enabled        = 1
  vim.g.indentLine_concealcursor  = 0
  vim.g.indentLine_char           = '┆'
  vim.g.indentLine_faster         = 1

-- Startify
  vim.g.webdevicons_enable_startify = 1
  vim.g.startify_files_number=8
  vim.g.startify_padding_left = 30 -- Hard coded padding for lists

  function updatePlugins()
    vim.cmd "PackerCompile"
    vim.cmd "PackerInstall"
    vim.cmd "PackerUpdate"
  end
  vim.cmd([[
    autocmd User StartifyReady exec 'IndentLinesDisable'
    autocmd User StartifyAllBufferOpened exec 'IndentLinesEnable'
    function! s:gitModified()
        let files = systemlist('git ls-files -m 2>/dev/null')
        return map(files, "{'line': v:val, 'path': v:val}")
    endfunction
    function! s:gitUntracked()
        let files = systemlist('git ls-files -o --exclude-standard --exclude=.DS_Store 2>/dev/null')
        return map(files, "{'line': v:val, 'path': v:val}")
    endfunction

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

    let g:startify_commands = [
          \{'a': ['Actualizar', 'lua updatePlugins()']},
          \{'r': ['Limpiar Historial de Undo', 'lua updatePlugins()']},
          \]

    let g:startify_lists = [
          \ { 'type': 'files',                    'header': startify#pad(['   RECIENTES']             )},
          \ { 'type': 'sessions',                 'header': startify#pad(['   SESIONES']              )},
          \ { 'type': function('s:gitModified'),  'header': startify#pad(['   GIT - Modificados']     )},
          \ { 'type': 'bookmarks',                'header': startify#pad(['   MARCADORES']            )},
          \ { 'type': 'commands',                 'header': startify#pad(['   COMANDOS']              )},
          \ { 'type': function('s:gitUntracked'), 'header': startify#pad(['   GIT - Sin Seguimiento'] )},
          \ ]
          " \ { 'type': 'dir',                     'header': startify#pad(['   RECIENTES DENTRO DE '. getcwd()]) },
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

-- Snippets
  if vim.fn.has('python3') then
    vim.g.UltiSnipsExpandTrigger='<Nop>'
    vim.g.UltiSnipsJumpForwardTrigger = '<TAB>'
    vim.g.UltiSnipsJumpBackwardTrigger = '<S-TAB>'
    vim.g.coc_snippet_next = '<TAB>'
    vim.g.coc_snippet_prev = '<S-TAB>'
    vim.g.UltiSnipsEditSplit="vertical"
  end

-- ale
  vim.g.ale_linters = {python= 'flake8' }

-- Tagbar
  vim.g.tagbar_autofocus = 1