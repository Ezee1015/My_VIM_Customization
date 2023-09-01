require("dapui").setup()
require("nvim-dap-virtual-text").setup({})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

-- DAP para C, C++, Rust
local whereis_gdb = vim.fn.system('whereis gdb')
local gdb_path = whereis_gdb:match('gdb: (%S+)')
if gdb_path then
    local dap = require('dap')
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