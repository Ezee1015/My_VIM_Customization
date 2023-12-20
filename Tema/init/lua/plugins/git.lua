return {

  {"tpope/vim-fugitive",
    dependencies = {
      -- Dependencia para :GBrowse
      -- "tpope/vim-rhubarb",
    },
    cmd = {
      "Git",
      "Gread",
      "Gwrite"
    },
    keys = {
      { '<leader>gp', ':Git push<CR>'   , { noremap= true, desc="Git push"       } },
      { '<leader>gl', ':Git pull<CR>'   , { noremap= true, desc="Git pull"       } },
      { '<leader>gs', ':Git<CR>'        , { noremap= true, desc="Git status"     } },
      { '<leader>gd', ':Gvdiffsplit<CR>', { noremap= true, desc="Git diff"       } },
      { '<leader>gB', ':Git blame<CR>'  , { noremap= true, desc="Git blame file" } },
    }
  },

  -- Símbolos Git dentro del archivo
  {"lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']g', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map('n', '[g', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        -- Actions
        -- map({'n', 'v'}, '<leader>gh', ':Gitsigns stage_hunk<CR>')
        -- map({'n', 'v'}, '<leader>gr', ':Gitsigns reset_hunk<CR>')
        -- map('n', '<leader>gu', gs.undo_stage_hunk)
      end
    },

    event = { "BufReadPre", "BufNewFile", "BufAdd" },

    keys = {
      { '<leader>gb', ':Gitsigns blame_line<CR>', { noremap= true , desc="Git blame line" } },
    }
  },
}
