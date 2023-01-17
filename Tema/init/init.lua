-- Function to verify a folder exists
function IsDir(file)
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
function IsFile(file)
   local f=io.open(file,"r")
   if f~=nil then io.close(f) return true else return false end
end

vim.o.termguicolors = true

-- lua/maps.lua
require("maps")
-- lua/plugins.lua
require("plugins")
-- lua/basic.lua
require("basic")
-- lua/compile.lua
require("compile")
-- lua/p-conf.lua
require("p-conf")
