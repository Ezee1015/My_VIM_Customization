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
-- Function to verify a file exists
function isfile(file)
   local f=io.open(file,"r")
   if f~=nil then io.close(f) return true else return false end
end

vim.o.termguicolors = true

-- lua/maps.lua
require("maps")
-- lua/plugins.lua
require("plugins")
-- lua/basic_conf.lua
require("basic_conf")
-- lua/plugins_conf.lua
require("plugins_conf")
-- lua/procesar.lua
require("procesar")
