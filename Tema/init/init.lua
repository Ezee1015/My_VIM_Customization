-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- Function to verify a folder exists
function isdir(file)
	  local isok, errstr, errcode = os.rename(file, file)
  if isok == nil then
     if errcode == 13 then
        -- Permission denied, but it exists
        return true
     end
     return false
  end
  return true
end

vim.o.termguicolors = true

-- lua/procesar.lua
require("procesar")
-- lua/plugins.lua
require("plugins")
-- lua/plugins_conf.lua
require("plugins_conf")
-- lua/basic_conf.lua
require("basic_conf")
-- lua/maps.lua
require("maps")
