-- Telescope File Browser
local fb_actions = require "telescope._extensions.file_browser.actions"

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
      display_stat = { date = true, size = true, mode = true },
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
