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
        ["<C-n>"] = require "telescope.actions".cycle_history_next,
        ["<C-p>"] = require "telescope.actions".cycle_history_prev,

        ["<C-j>"] = require "telescope.actions".move_selection_next,
        ["<C-k>"] = require "telescope.actions".move_selection_previous,

        ["<C-h>"] = require "telescope.actions".preview_scrolling_up,
        ["<C-l>"] = require "telescope.actions".preview_scrolling_down,

        ["<ESC>"] = require "telescope.actions".close
      }
    },
  }
}
