-- Total de Palabras en el archivo
local function getWords() return "\u{23B5} "..tostring(vim.fn.wordcount().words) end
--
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
local function time()
  return os.date("%H:%M")
end

return {
	{"nvim-lualine/lualine.nvim",
    opts = {
      options = {
        refresh = {
          statusline = 500,
        },
        disabled_filetypes = {"startify"},
      },
      sections = {
        lualine_x = {{ searchCount }, 'fileformat', 'filetype'},
        lualine_y = {'progress','location', },
        lualine_z = {{ getWords },{ time }}
      },
      extensions = {'nvim-tree'}
    },

    event = { "BufReadPre", "BufNewFile", "BufAdd" },
  }
}
