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
