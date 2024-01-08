local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

-- Instalación de los servidores de lenguaje y DAPs
return {
  {"williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },

  "williamboman/mason-lspconfig.nvim",

  {"WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- DAP
        'cpptools',
        'debugpy',

        -- LSP
        'clangd',
        'jdtls',
        'lua-language-server',
        'python-lsp-server',
      }
    }
  }
}
