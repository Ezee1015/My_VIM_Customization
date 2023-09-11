local function telescope_config()
  -- Telescope File Browser
  local fb_actions = require "telescope._extensions.file_browser.actions"

  require('telescope').setup{
    defaults = {
      -- layout_strategy = 'vertical',
      layout_strategy = 'horizontal',
      layout_opts = {
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
          ["<C-n>"] = require "telescope.actions".cycle_history_next,
          ["<C-p>"] = require "telescope.actions".cycle_history_prev,

          ["<C-j>"] = require "telescope.actions".move_selection_next,
          ["<C-k>"] = require "telescope.actions".move_selection_previous,

          ["<C-h>"] = require "telescope.actions".preview_scrolling_up,
          ["<C-l>"] = require "telescope.actions".preview_scrolling_down,

          ["<ESC>"] = require "telescope.actions".close
        }
      },
    },
    extensions = {
      file_browser = {
        -- path
        -- cwd
        cwd_to_path = false,
        grouped = false,
        files = true,
        add_dirs = true,
        depth = 1,
        auto_depth = false,
        select_buffer = false,
        hidden = false,
        -- respect_gitignore
        -- browse_files
        -- browse_folders
        hide_parent_dir = false,
        collapse_dirs = false,
        prompt_path = false,
        quiet = false,
        dir_icon = "",
        dir_icon_hl = "Default",
        display_stat = false, -- { date = false, size = false, mode = false },
        hijack_netrw = false,
        use_fd = true,
        git_status = true,
        mappings = {
          ["i"] = {
            ["<A-c>"] = fb_actions.create,
            ["<S-CR>"] = fb_actions.create_from_prompt,
            ["<A-r>"] = fb_actions.rename,
            ["<A-m>"] = fb_actions.move,
            ["<A-y>"] = fb_actions.copy,
            ["<A-d>"] = fb_actions.remove,
            ["<C-o>"] = fb_actions.open,
            ["<C-g>"] = fb_actions.goto_parent_dir,
            ["<C-e>"] = fb_actions.goto_home_dir,
            ["<C-w>"] = fb_actions.goto_cwd,
            ["<C-t>"] = fb_actions.change_cwd,
            ["<C-f>"] = fb_actions.toggle_browser,
            ["<C-h>"] = fb_actions.toggle_hidden,
            ["<C-s>"] = fb_actions.toggle_all,
            ["<bs>"] = fb_actions.backspace,
          },
          ["n"] = {
            ["c"] = fb_actions.create,
            ["r"] = fb_actions.rename,
            ["m"] = fb_actions.move,
            ["y"] = fb_actions.copy,
            ["d"] = fb_actions.remove,
            ["o"] = fb_actions.open,
            ["g"] = fb_actions.goto_parent_dir,
            ["e"] = fb_actions.goto_home_dir,
            ["w"] = fb_actions.goto_cwd,
            ["t"] = fb_actions.change_cwd,
            ["f"] = fb_actions.toggle_browser,
            ["h"] = fb_actions.toggle_hidden,
            ["s"] = fb_actions.toggle_all,
          },
        },
      },
    },
  }
end

local neoclip_opts = {
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
      }
    }
  }
}

return {
  {"nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",

      {"AckslD/nvim-neoclip.lua",
        opts = neoclip_opts,
      },

      "nvim-telescope/telescope-file-browser.nvim",
    },

    config = telescope_config,

    cmd = "Telescope",

    keys = {
      { 'gd'        , "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", desc="Ir a la definición" },
      { 'gr'        , "<cmd>lua require('telescope.builtin').lsp_references()<cr>" , desc="Ir a las referencias" },
      { '<leader>z' , "<cmd>lua require('telescope.builtin').spell_suggest()<cr>"  , desc="Corrector ortográfico" },
      { '<leader>b' , "<cmd>lua require('telescope.builtin').buffers()<cr>"        , desc="Lista buffers" },
      { '<leader>dd', "<cmd>lua require('telescope.builtin').diagnostics()<cr>"    , desc="Diagnósticos LSP" },
      { '<leader>dh', "<cmd>lua require('telescope.builtin').help_tags()<cr>"      , desc="Ayuda neovim" },
      { '<leader>dk', "<cmd>lua require('telescope.builtin').keymaps()<cr>"        , desc="Lista de keymaps" },
      { '<leader>dt', "<cmd>lua require('telescope.builtin').treesitter()<cr>"     , desc="Componentes con Treesitter" },
      { '<leader>df', "<cmd>lua require('telescope.builtin').filetypes()<cr>"      , desc="Tipo de archivos" },
      { '<leader>dl', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>"   , desc="Buscar por lineas" },
      { '<leader>de', "<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>", desc="Explorador de archivos" },
      { '<leader>dg', "<cmd>lua require('telescope.builtin').live_grep()<cr>"      , desc="Ripgrep" },
      { '<leader>ds', "<cmd>lua require('telescope.builtin').find_files()<cr>"     , desc="Buscar archivos" },
      { '<leader>do', "<cmd>lua require('telescope.builtin').oldfiles()<cr>"       , desc="Archivos abiertos recientemente" },
      { '<leader>d/', "<cmd>lua require('telescope.builtin').search_history{}<CR>" , desc="Historial de busqueda" },
      { '<leader>dQ', "<cmd>lua require('telescope.builtin').registers{}<CR>"      , desc="Registros"},
      { '<leader>dq', "<cmd>lua require('telescope').extensions.macroscope.default()<CR>"      , desc="Macros" },
      { '<leader>dc', "<cmd>lua require('telescope').extensions.neoclip.default()<CR>"         , desc="Portapapeles" },
    }
  },
}
