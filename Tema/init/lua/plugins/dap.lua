local function each_dap_config()
  local dap = require("dap")

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
end

local function dap_ui_config()
  require("dapui").setup()

  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
end

local function dap_config ()
-- Define los highlight
vim.fn.sign_define('DapBreakpoint'         , { linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected' , { linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint'           , { linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped'            , { linehl='DapStopped', numhl= 'DapStopped' })

-- Establece los colores
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, bg = '#600505'})
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, bg = '#03457a'  })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, bg = '#193b00'   })

-- Llama a la configuración de cada servidor
each_dap_config()
end

return {
	{"rcarriga/nvim-dap-ui",
		dependencies={
			{"mfussenegger/nvim-dap",
        config = dap_config
      },

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

    config = dap_ui_config,

    keys = {
      { '<C-s>d', ":lua require('dapui').toggle()<CR>"            , desc="Mostrar/Ocultar DAP" },
      { '<C-s>r', ":lua require('dapui').open({reset = true})<CR>", desc="Restaurar interfaz DAP" },
      { '<C-s>b', ":lua require('dap').toggle_breakpoint()<CR>"   , desc="Breakpoint DAP" },
      { '<C-s>c', ":lua require('dap').continue()<CR>"            , desc="Comenzar DAP" },
      { '<C-s>n', ":lua require('dap').step_over()<CR>"           , desc="Siguiente instrucción DAP" },
      { '<C-s>i', ":lua require('dap').step_into()<CR>"           , desc="Entrar en la instrucción DAP" },
      { '<C-s>o', ":lua require('dap').step_out()<CR>"            , desc="Salir de la instrucción DAP" },
      { '<C-s>s', ":lua require('dap').close()<CR>"               , desc="Detener DAP" },
      { '<C-s><S-b>', ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc="Breakpoint condicional DAP" },
    }
  }
}
