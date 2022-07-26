--*****************************************************************************
--  Vim-Plug core
--*****************************************************************************
vim.g.vimplug_exists = vim.fn.expand('~/.config/nvim/lua/packer.nvim')

if not vim.call('filereadable', 'vim.g.vimplug_exists') then
  vim.cmd([[
  	if !executable(curl_exists)
      		echoerr "You have to install curl or first install vim-plug yourself!"
      		execute "q!"
  	endif
	]])
  print ("Installing Vim-Plug...")
  print ("")
  vim.cmd([[!git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.config/nvim/lua/packer.nvim]])

  vim.cmd([[execure PackerInstall]])
end
