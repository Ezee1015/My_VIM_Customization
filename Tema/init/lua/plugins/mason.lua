-- Instalación de los servidores de lenguaje y DAPs
return {
  {"williamboman/mason.nvim",
    config = {
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
    config = {
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
