return {
	{"rcarriga/nvim-dap-ui",
		dependencies={
			"mfussenegger/nvim-dap",

			-- Muestra junto a la declaración el valor de la variable
			{"theHamsta/nvim-dap-virtual-text",
        config = true
      },

			{"nvim-telescope/telescope-dap.nvim",
        dependencies = {
          "nvim-telescope/telescope.nvim"
        },
        config = function ()
          require('telescope').load_extension('dap')
        end
      },

			-- DAPs
			"mfussenegger/nvim-dap-python",
		},

    config = function ()
      require("dapui").setup()

      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- DAP para C, C++, Rust
      local whereis_gdb = vim.fn.system('whereis gdb')
      local gdb_path = whereis_gdb:match('gdb: (%S+)')
      if gdb_path then
        dap.adapters.cppdbg = {
          id = 'cppdbg',
          type = 'executable',
          command = os.getenv("HOME")..'/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
        }
        dap.configurations.cpp = {
          {
            name = "Launch file",
            type = "cppdbg",
            request = "launch",
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = true,
          },
          {
            name = 'Attach to gdbserver :1234',
            type = 'cppdbg',
            request = 'launch',
            MIMode = 'gdb',
            miDebuggerServerAddress = 'localhost:1234',
            miDebuggerPath = gdb_path,
            cwd = '${workspaceFolder}',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
          },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
      end

      -- DAP para Python
      -- Si tira algún error con una librería del proyecto, hay que instalarla con...
      -- ~/.local/share/nvim/mason/packages/debugpy/venv/bin/pip install [librería]
      require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
    end,

    keys = {
      { '<C-d>d', ":lua require('dapui').toggle()<CR>"            , desc="Mostrar/Ocultar DAP" },
      { '<C-d>r', ":lua require('dapui').open({reset = true})<CR>", desc="Restaurar interfaz DAP" },
      { '<C-d>b', ":lua require('dap').toggle_breakpoint()<CR>"   , desc="Breakpoint DAP" },
      { '<C-d>c', ":lua require('dap').continue()<CR>"            , desc="Comenzar DAP" },
      { '<C-d>n', ":lua require('dap').step_over()<CR>"           , desc="Siguiente instrucción DAP" },
      { '<C-d>i', ":lua require('dap').step_into()<CR>"           , desc="Entrar en la instrucción DAP" },
      { '<C-d>o', ":lua require('dap').step_out()<CR>"            , desc="Salir de la instrucción DAP" },
      { '<C-d>s', ":lua require('dap').close()<CR>"               , desc="Detener DAP" },
      { '<C-d><S-b>', ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc="Breakpoint condicional DAP" },
    }
  }
}
