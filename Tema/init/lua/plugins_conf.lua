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
  -- local function formatTime(value)
  --   if value < 10 then
  --     return '0'..value
  --   end
  --   return value
  -- end
  -- Shows a clock in the statusline
  local function time()
    -- local unixTime = os.time()
    -- -- local seconds  = formatTime(unixTime % 60) -- UNCOMENT TO ENABLE SECONDS. Restart NeoVim in order to work properly
    -- local minutes  = formatTime(math.floor(unixTime%3600/60))
    -- local hours    = formatTime(math.floor(unixTime%86400/3600))
    -- local timezone = -3 -- Argentina GMT-3
    -- -- Apply Timezone
    -- hours     = hours + timezone
    -- if hours <= 0 then
    --   hours   = 24 + hours
    -- end

    -- if seconds == nil then
    --   return "\u{f64f} "..hours..":"..minutes
    -- end
    -- return "\u{f64f} "..hours..":"..minutes..":"..seconds
    -- return os.date("%H:%M:%S")
    return os.date("%H:%M")
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
      -- diagnostics = "coc",
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
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,

          ["<C-h>"] = actions.preview_scrolling_up,
          ["<C-l>"] = actions.preview_scrolling_down,

          ["<ESC>"] = actions.close
        }
      },
    }
  }

-- Startify
  vim.g.webdevicons_enable_startify = 1
  vim.g.startify_files_number=8
  vim.g.startify_padding_left = 30 -- Hard coded padding for lists
  vim.g.startify_custom_header = {
        "      ___           ___           ___                                      ___      ",
        "     /  /\\         /  /\\         /  /\\          ___            ___        /  /\\     ",
        "    /  /::|       /  /::\\       /  /::\\        /  /\\          /__/\\      /  /::|    ",
        "   /  /:|:|      /  /:/\\:\\     /  /:/\\:\\      /  /:/          \\__\\:\\    /  /:|:|    ",
        "  /  /:/|:|__   /  /::\\ \\:\\   /  /:/  \\:\\    /  /:/           /  /::\\  /  /:/|:|__  ",
        " /__/:/ |:| /\\ /__/:/\\:\\ \\:\\ /__/:/ \\__\\:\\  /__/:/  ___    __/  /:/\\/ /__/:/_|::::\\ ",
        " \\__\\/  |:|/:/ \\  \\:\\ \\:\\_\\/ \\  \\:\\ /  /:/  |  |:| /  /\\  /__/\\/:/~~  \\__\\/  /~~/:/ ",
        "     |  |:/:/   \\  \\:\\ \\:\\    \\  \\:\\  /:/   |  |:|/  /:/  \\  \\::/           /  /:/  ",
        "     |__|::/     \\  \\:\\_\\/     \\  \\:\\/:/    |__|:|__/:/    \\  \\:\\          /  /:/   ",
        "     /__/:/       \\  \\:\\        \\  \\::/      \\__\\::::/      \\__\\/         /__/:/    ",
        "     \\__\\/         \\__\\/         \\__\\/           ~~~~                     \\__\\/     ",
        " ",
        }
  vim.g.startify_custom_header = vim.fn['startify#center'](vim.g.startify_custom_header)

  function GitModified()
      local files = vim.fn.systemlist('git ls-files -m 2>/dev/null')
      return vim.fn.map(files, "{'line': v:val, 'path': v:val}")
  end
  function GitUntracked()
      local files = vim.fn.systemlist('git ls-files -o --exclude-standard --exclude=.DS_Store 2>/dev/null')
      return vim.fn.map(files, "{'line': v:val, 'path': v:val}")
  end

  -- vim.g.startify_bookmarks = {
  --   { c = '~/.config/nvim/init.lua'},
  -- }
  vim.g.startify_commands = {
    { g = {'Carpeta de Github', "cd ~/github/ | lua require('telescope.builtin').find_files()"}},
    { r = {'Recargar Startify', 'Startify'}},
    { c = {'Configuración', "cd ~/.config/nvim/ | lua require('telescope.builtin').find_files()"}},
    { a = {'Actualizar Plugins', 'PackerSync'}},
    { u = {'Limpiar Historial de Undo', '!rm ~/.local/share/nvim/undo/*'}},
    { p = {'Información sobre LSP', 'LspInstallInfo'}},
    -- { s = {'Tiempo de Arranque', 'StartupTime'}},
  }
  vim.g.startify_lists = {
    { type = 'files'                    , header = vim.fn['startify#pad']({'   RECIENTES'}             )},
    { type = 'sessions'                 , header = vim.fn['startify#pad']({'   SESIONES'}              )},
    -- { type = function('GitModified')  , header = vim.fn['startify#pad']({'   GIT - Modificados'}     )},
    -- { type = function('GitUntracked') , header = vim.fn['startify#pad']({'   GIT - Sin Seguimiento'} )},
    { type = 'bookmarks'                , header = vim.fn['startify#pad']({'   MARCADORES'}            )},
    { type = 'commands'                 , header = vim.fn['startify#pad']({'   COMANDOS'}              )},
    -- { type = 'dir'                      , header = vim.fn['startify#pad']({'   RECIENTES DENTRO DE '. getcwd()}) },
  }
  -- LO MISMO QUE EL ANTERIOR PERO EN VEZ DE UN TAB ESTÁ CENTRADO
  -- let g:startify_lists = [
  --       \ { 'type': 'files',                   'header': startify#center(['   RECIENTES'])            },
  --       \ { 'type': 'dir',                     'header': startify#center(['   DENTRO DE '. getcwd()]) },
  --       \ { 'type': 'sessions',                'header': startify#center(['   SESIONES'])             },
  --       \ { 'type': function('s:gitModified'), 'header': startify#center(['   GIT - Modificados'])},
  --       \ { 'type': 'bookmarks',               'header': startify#center(['   Bookmarks'])            },
  --       \ ]
  vim.cmd([[
    autocmd User StartifyReady exec 'IndentBlanklineDisable'
    autocmd User StartifyAllBufferOpened exec 'IndentBlanklineEnable'

    function! StartifyEntryFormat() abort
      return 'v:lua.webDevIcons(absolute_path) ." ". entry_path'
    endfunction
    ]])
  -- Agrega los iconos
  function _G.webDevIcons(path)
    local filename = vim.fn.fnamemodify(path, ':t')
    local extension = vim.fn.fnamemodify(path, ':e')
    return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
  end

-- Tagbar
  vim.g.tagbar_autofocus = 1

--[[ Alternatives Headers for Startify
vim.g.startify_custom_header = {
'',
'',
'                                       ██            ',
'                                      ░░             ',
'    ███████   █████   ██████  ██    ██ ██ ██████████ ',
'   ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██',
'    ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██',
'    ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██',
'    ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██',
'   ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░ ',
'',
'',
}
vim.g.startify_custom_header = {
"",
"         .          ."
"       ';;,.        ::'"
"     ,:::;,,        :ccc,"
"    ,::c::,,,,.     :cccc,"
"    ,cccc:;;;;;.    cllll,"
"    ,cccc;.;;;;;,   cllll;"
"    :cccc; .;;;;;;. coooo;"
"    ;llll;   ,:::::'loooo;"
"    ;llll:    ':::::loooo:"
"    :oooo:     .::::llodd:"
"    .;ooo:       ;cclooo:."
"      .;oc        'coo;."
"        .'         .,."
}
vim.g.startify_custom_header = {
    '',
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    '                                                       ',
    '',
}
 --]]

-- NVIM LSP
  local lsp = require('lsp-zero')
  lsp.preset('recommended')
  lsp.nvim_workspace()
  lsp.setup()

  vim.opt.completeopt= "menu,menuone,noselect"

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  local cmp = require'cmp'
  local luasnip = require'luasnip'
  --   פּ ﯟ   some other good icons
  local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  }
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<ESC>"] = cmp.mapping.close(),

      ["<S-k>"] = nil,
    },
   formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          nvim_lsp = "- LSP",
          luasnip = "- Snippet",

          buffer = "- Buffer",
          path = "- Path",
        })[entry.source.name]
        return vim_item
      end,
    }
  })

-- Muestra el mensaje de error cuando se mantiene el cursor quieto
vim.diagnostic.config({
  virtual_text = true
})
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])

  require("nvim-lsp-installer").setup({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
  })

-- TreeSitter
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "lua", "java", "python", "bash", "html", "css", "php", "sql" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    -- sync_install = false,

    -- List of parsers to ignore installing (for "all")
    -- ignore_install = { "javascript" },

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
      enable = true,
    },
  }

-- GitSigns
require('gitsigns').setup()

--Indent Blankline
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

-- NeoClip
require('neoclip').setup({
    history = 1000,
    enable_persistent_history = false,
    length_limit = 1048576,
    continuous_sync = false,
    db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
    filter = nil,
    preview = true,
    prompt = nil,
    default_register = '"',
    default_register_macros = 'q',
    enable_macro_history = true,
    content_spec_column = false,
    on_paste = {
      set_reg = false,
    },
    on_replay = {
      set_reg = false,
    },
    keys = {
      telescope = {
        i = {
          -- select = '<cr>',
          paste = '<cr>',
          -- paste_behind = '<S-<cr>>',
          replay = '<c-q>',  -- replay a macro
          delete = '<c-d>',  -- delete an entry
          custom = {},
        },
      },
    },
  })

-- ZenMode
require("zen-mode").setup {
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 100, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
}

-- Vim Commentary
require('Comment').setup {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbb',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
  }

-- Vim Multiple Cursors
vim.g.VM_show_warnings = 0
