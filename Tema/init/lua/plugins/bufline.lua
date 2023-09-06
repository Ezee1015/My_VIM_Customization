return {
	{"akinsho/bufferline.nvim",
    config = function()
      vim.o.sessionoptions = (vim.o.sessionoptions .. ",globals")
      require('bufferline').setup {
        options = {
          close_command = "call StartifyAtExit()",       -- can be a string | function, see "Mouse actions"
          right_mouse_command = "call StartifyAtExit()", -- can be a string | function, see "Mouse actions"
          left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
          middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
          tab_size = 20,
          diagnostics = "nvim_lsp",
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
    end,

    event = { "BufReadPre", "BufNewFile", "BufAdd" },

    keys = {
      { '<TAB>'         , ':BufferLineCycleNext<CR>'        , desc="Siguiente buffer" },
      { '<S-TAB>'       , ':BufferLineCyclePrev<CR>'        , desc="Anterior buffer" },
      { '<S-t>'         , ':enew<CR>:NvimTreeToggle<CR>'    , desc="Nuevo buffer" },
      { '<leader>b<Right>', ':BufferLineMoveNext<CR>'       , desc="Mover buffer a la derecha" },
      { '<leader>b<Left>' , ':BufferLineMovePrev<CR>'       , desc="Mover buffer a la izquierda" },
      { '<leader>be'    , ':BufferLineSortByExtension<CR>'  , desc="Ordenar buffers por extención" },
      { '<leader>bd'    , ':BufferLineSortByDirectory<CR>'  , desc="Ordenar buffers por carpeta" },
      { '<leader>1'     , ':BufferLineGoToBuffer 1<CR>'     , desc="Ir al buffer 1" },
      { '<leader>2'     , ':BufferLineGoToBuffer 2<CR>'     , desc="Ir al buffer 2" },
      { '<leader>3'     , ':BufferLineGoToBuffer 3<CR>'     , desc="Ir al buffer 3" },
      { '<leader>4'     , ':BufferLineGoToBuffer 4<CR>'     , desc="Ir al buffer 4" },
      { '<leader>5'     , ':BufferLineGoToBuffer 5<CR>'     , desc="Ir al buffer 5" },
      { '<leader>6'     , ':BufferLineGoToBuffer 6<CR>'     , desc="Ir al buffer 6" },
      { '<leader>7'     , ':BufferLineGoToBuffer 7<CR>'     , desc="Ir al buffer 7" },
      { '<leader>8'     , ':BufferLineGoToBuffer 8<CR>'     , desc="Ir al buffer 8" },
      { '<leader>9'     , ':BufferLineGoToBuffer 9<CR>'     , desc="Ir al buffer 9" },
      { '<leader>0'     , ':BufferLineGoToBuffer 10<CR>'    , desc="Ir al buffer 10" },
    }
  }
}
