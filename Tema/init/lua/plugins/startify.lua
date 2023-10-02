function Update_nvim()
  vim.cmd('Lazy sync')
  vim.cmd('TSUpdate')
end

function Delete_undo_history()
  local input = vim.fn.confirm("Do you want to proceed? (y/n)", "&Yes\n&No")

  if input == 1 then
      vim.cmd("!rm ~/.local/share/nvim/undo/*")
      print("\nHistorial de Deshacer eliminado!\n")
  else
      print("\nEliminado cancelado...\n")
  end
end

local function startify_config()
  vim.g.webdevicons_enable_startify = 1
  vim.g.startify_files_number=8
  vim.g.startify_update_oldfiles = 1
  vim.g.startify_session_dir='~/.config/nvim/sessions'
  vim.g.startify_padding_left = 30 -- Hard coded padding for lists
  vim.g.startify_custom_header = {
    "      ___           ___           ___                                      ___      ",
    "     /  /\\         /  /\\         /  /\\          ___            ___        /  /\\     ",
    "    /  /::|       /  /::\\       /  /::\\        /  /\\          /__/\\      /  /::|    ",
    "   /  /:|:|      /  /:/\\:\\     /  /:/\\:\\      /  /:/          \\__\\:\\    /  /:|:|    ",
    "  /  /:/|:|__   /  /::\\ \\:\\   /  /:/  \\:\\    /  /:/           /  /::\\  /  /:/|:|__  ",
    " /__/:/ |:| /\\ /__/:/\\:\\ \\:\\ /__/:/ \\__\\:\\  /__/:/  ___    __/  /:/\\/ /__/:/_|::::\\ ",
    " \\__\\/  |:|/:/ \\  \\:\\ \\:\\_\\/ \\  \\:\\ /  /:/  |  |:| /  /\\  /__/\\/:/~~  \\__\\/  /~~/:/ ",
    "     |  |:/:/   \\  \\:\\ \\:\\    \\  \\:\\  /:/   |  |:|/  /:/  \\  \\::/           /  /:/  ",
    "     |__|::/     \\  \\:\\_\\/     \\  \\:\\/:/    |__|:|__/:/    \\  \\:\\          /  /:/   ",
    "     /__/:/       \\  \\:\\        \\  \\::/      \\__\\::::/      \\__\\/         /__/:/    ",
    "     \\__\\/         \\__\\/         \\__\\/           ~~~~                     \\__\\/     ",
    " ",
  }
  vim.g.startify_custom_header = vim.fn['startify#center'](vim.g.startify_custom_header)

  function GitModified()
    local files = vim.fn.systemlist('git ls-files -m 2>/dev/null')
    return vim.fn.map(files, "{'line': v:val, 'path': v:val}")
  end
  function GitUntracked()
    local files = vim.fn.systemlist('git ls-files -o --exclude-standard --exclude=.DS_Store 2>/dev/null')
    return vim.fn.map(files, "{'line': v:val, 'path': v:val}")
  end

  -- vim.g.startify_bookmarks = {
  --   { c = '~/.config/nvim/init.lua'},
  -- }
  vim.g.startify_commands = {
    { a = {'󱐦  Actualizar Plugins', 'lua Update_nvim()'}},
    { c = {'  Configuración', "cd ~/.config/nvim/ | lua require('telescope.builtin').find_files()"}},
    { g = {'  Carpeta de Github', "cd ~/github/ | lua require('telescope.builtin').find_files()"}},
    { r = {'󰚰  Telescope Recent Files', 'Telescope oldfiles'}},
    { l = {'󰐱  Información sobre Lazy', 'Lazy'}},
    { p = {'  Información sobre LSP y DAP', 'Mason'}},
    { o = {'  Log del LSP', 'e ~/.local/state/nvim/lsp.log'}},
    { u = {'  Limpiar Historial de Undo', 'lua Delete_undo_history()'}},
  }
  vim.g.startify_lists = {
    { type = 'files'                    , header = vim.fn['startify#pad']({'   RECIENTES'}             )},
    { type = 'sessions'                 , header = vim.fn['startify#pad']({'   SESIONES'}              )},
    -- { type = function('GitModified')  , header = vim.fn['startify#pad']({'   GIT - Modificados'}     )},
    -- { type = function('GitUntracked') , header = vim.fn['startify#pad']({'   GIT - Sin Seguimiento'} )},
    { type = 'bookmarks'                , header = vim.fn['startify#pad']({'   MARCADORES'}            )},
    { type = 'commands'                 , header = vim.fn['startify#pad']({'   COMANDOS'}              )},
    -- { type = 'dir'                      , header = vim.fn['startify#pad']({'   RECIENTES DENTRO DE '. getcwd()}) },
  }
  -- LO MISMO QUE EL ANTERIOR PERO EN VEZ DE UN TAB ESTÁ CENTRADO
  -- let g:startify_lists = [
  --       \ { 'type': 'files',                   'header': startify#center(['   RECIENTES'])            },
  --       \ { 'type': 'dir',                     'header': startify#center(['   DENTRO DE '. getcwd()]) },
  --       \ { 'type': 'sessions',                'header': startify#center(['   SESIONES'])             },
  --       \ { 'type': function('s:gitModified'), 'header': startify#center(['   GIT - Modificados'])},
  --       \ { 'type': 'bookmarks',               'header': startify#center(['   Bookmarks'])            },
  --       \ ]
  vim.cmd([[
  function! StartifyEntryFormat() abort
  return 'v:lua.webDevIcons(absolute_path) ." ". entry_path'
  endfunction
  ]])
  -- Agrega los iconos
  function _G.webDevIcons(path)
    local filename = vim.fn.fnamemodify(path, ':t')
    local extension = vim.fn.fnamemodify(path, ':e')
    return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
  end
end

return {
	{"mhinz/vim-startify",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
    config = startify_config
	}
}



--[[ Alternatives Headers for Startify
vim.g.startify_custom_header = {
'',
'',
'                                       ██            ',
'                                      ░░             ',
'    ███████   █████   ██████  ██    ██ ██ ██████████ ',
'   ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██',
'    ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██',
'    ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██',
'    ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██',
'   ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░ ',
'',
'',
}
vim.g.startify_custom_header = {
"",
"         .          ."
"       ';;,.        ::'"
"     ,:::;,,        :ccc,"
"    ,::c::,,,,.     :cccc,"
"    ,cccc:;;;;;.    cllll,"
"    ,cccc;.;;;;;,   cllll;"
"    :cccc; .;;;;;;. coooo;"
"    ;llll;   ,:::::'loooo;"
"    ;llll:    ':::::loooo:"
"    :oooo:     .::::llodd:"
"    .;ooo:       ;cclooo:."
"      .;oc        'coo;."
"        .'         .,."
}
vim.g.startify_custom_header = {
    '',
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    '                                                       ',
    '',
}
 --]]
