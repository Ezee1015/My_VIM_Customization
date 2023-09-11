
return {
	-- Centra el código en la pantalla
	{"folke/zen-mode.nvim",
		dependencies = {
			"folke/twilight.nvim" -- Resalta la porción de código debajo del cursor
    },
    opts = {
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 100, -- width of the Zen window
        height = 1, -- height of the Zen window
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
        tmux = { enabled = false }, -- disables the tmux statusline
      },
      -- callback where you can add custom code when the Zen window opens
      on_open = function(win)
        vim.cmd [[map j jzz]]
        vim.cmd [[map k kzz]]
      end,
      -- callback where you can add custom code when the Zen window closes
      on_close = function()
        vim.cmd [[unmap j]]
        vim.cmd [[unmap k]]
      end,
    },
    keys = {
      { '<leader>a', ":ZenMode<CR>", { silent= true, noremap= true, desc="Zen Mode" } },
    }
	}
}
