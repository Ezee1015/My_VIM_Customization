local function neorg_config()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes",
        },
      },
    },
    ["core.export"] = {}, -- Export org files
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.summary"] = {
      config = {
        strategy = "by_path", -- TOC by path, and not by the categories
      },
    }, -- For a table of contents of multiple files
    ["core.pivot"] = {}, -- For changing between ordered an unordered lists
    ["core.presenter"] = {
      config = {
        zen_mode = "zen-mode"
      }
    }, -- For changing between ordered an unordered lists
    ["core.itero"] = {}, -- Alt + Enter to new line with line/heading/etc.
    ["core.integrations.telescope"] = {},
    -- ["core.ui.calendar"] = {}, -- For changing between ordered an unordered lists
  },
}
end

local function neorg_telescope_config()
  local neorg_callbacks = require("neorg.core.callbacks")

  neorg_callbacks.on_event(
    "core.keybinds.events.enable_keybinds",
    function(_, keybinds)
      -- Load Telescope from Lazy loading
      require("lazy").load({
        wait = true,
        show = false,
        plugins = "telescope-dap.nvim",
        concurrency = 0 -- I don't know what that means
      })

      -- Map all the below keybinds only when the "norg" mode is active
      keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
          { "<LocalLeader>il", "core.integrations.telescope.insert_link" },
          { "<LocalLeader>if", "core.integrations.telescope.insert_file_link" },

          { "<LocalLeader>sl", "core.integrations.telescope.find_linkable" },
          { "<LocalLeader>sf", "core.integrations.telescope.find_norg_files" },
          { "<LocalLeader>sh", "core.integrations.telescope.search_headings" },

          { "<LocalLeader>sw", "core.integrations.telescope.switch_workspace" },
        },

        -- i = { -- Bind in insert mode
        --   { "<C-l>", "core.integrations.telescope.insert_link" },
        -- },
      }, { silent = true, noremap = true, })
    end
  , _)
end

return {
  -- {"nvim-neorg/neorg",
  --   -- build = ":Neorg sync-parsers",
  --
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --
  --   config = function()
  --     neorg_config()
  --     neorg_telescope_config()
  --   end,
  --
  --   event = { "BufReadPre", "BufNewFile", "BufAdd" },
  --
  --   keys = {
  --     { '<leader>n'      , "<cmd>Neorg workspace notes<cr>", desc="Abre bloc de notas" },
  --   }
  -- }
}
