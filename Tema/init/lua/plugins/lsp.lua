local function luasnip_config()
  local ls = require("luasnip")
  local s = ls.s
  local text = ls.text_node
  local insert = ls.insert_node

  require("luasnip.loaders.from_vscode").lazy_load()

  -- Agrega la etiqueta "ul" que es subrayado en markdown
  ls.add_snippets("markdown", {
    s("ul", {
      text("<ins>"),
      insert(1, "Texto Subrayado"),
      text("</ins> "),
      insert(0),
    })
  })
  ls.add_snippets("markdown", {
    s("center", {
      text({ '<div align="center">', "\t" }),
      insert(1),
      text({ "\t", "</div> " }),
      insert(0),
    })
  })

  -- Agrega el 'sout' en java (ya está el 'sysout' que hace lo mismo, pero 'sout' es más corto y me parece mejor)
  ls.add_snippets("java", {
    s("sout", {
      text("System.out.println("),
      insert(1),
      text(");"),
      insert(0),
    })
  })
end

local function lspconfig_config()
  -- Muestra el mensaje de error cuando se mantiene el cursor quieto
  vim.diagnostic.config({
    virtual_text = true
  })

  require'lspconfig'.clangd.setup({})

  require('lspconfig')['jdtls'].setup({
    settings = {
      signatureHelp = {enabled = true}, contentProvider = {preferred = 'fernflower'}
    },
    on_init = function(client)
      if client.config.settings then
        client.notify('workspace/didChangeConfiguration', {settings = client.config.settings})
      end
    end
  })

  -- Lua-Language-Server
  require'lspconfig'.lua_ls.setup {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false, -- Quita los mensaje molestos cada vez que abro un archivo .lua
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }
end

local lsp_signature_opts = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
  -- set to 0 if you DO NOT want any API comments be shown
  -- This setting only take effect in insert mode, it does not affect signature help in normal
  -- mode, 10 by default

  max_height = 12, -- max height of signature floating_window
  max_width = 80, -- max_width of signature floating_window
  noice = false, -- set to true if you using noice to render markdown
  wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = 1, -- adjust float windows x position.
  floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
  -- can be either number or function, see examples

  close_timeout = 4000, -- close floating window after ms when laster parameter is entered
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🧠 ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crashplco
  hint_scheme = "String",
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none, or a table of borders
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

  select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
  move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
}

local function cmp_config ()
  vim.opt.completeopt= "menu,menuone,noselect"
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')

  --         פּ  ﯟ   m    󰈔  some other good icons
  local kind_icons = {
    Text = "󰦨",
    Method = "m",
    Function = " ",
    Constructor = "",
    Field = "",
    Variable = "󰫧",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "󰰊",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  }

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<ESC>"] = cmp.mapping.close(),

      ['<CR>'] = cmp.mapping.confirm(), -- { select = true }

      ["<S-k>"] = nil,
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          nvim_lsp = "- LSP",
          luasnip = "- Snippet",
          path = "- Path",
          buffer = "- Buffer",
        })[entry.source.name]
        return vim_item
      end,
    },
    sources = {
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
    }
  })

  -- If you want insert `(` after select function or method item
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
end

local function lsp_zero_config()
  local lsp_zero = require('lsp-zero')

  lsp_zero.preset('recommended')
  lsp_zero.nvim_workspace()

  local lsp = require('lsp-zero').preset({})

  lsp.on_attach(function(_, bufnr)

    lsp.default_keymaps({
      buffer = bufnr,
      -- NO Mapea...
      -- F2 y F3 porque lo va a ocupar Nvim-tree
      -- gr y gd porque lo reemplaza con Telescope
      omit = {'<F2>', '<F3>', 'gr', 'gd'},
    })
  end)

  lsp.setup()
end

return {
	-- Lsp
	{"neovim/nvim-lspconfig",
		dependencies = {
			-- Autocompletado
			{"hrsh7th/nvim-cmp",

				dependencies = {
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"saadparwaiz1/cmp_luasnip",
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-nvim-lua",

          -- Cerrado automático de paréntesis, llaves, comillas, etc.
          {"windwp/nvim-autopairs",
            config = true
          },

          -- Snippets
          {"L3MON4D3/LuaSnip",
            dependencies = {
              {"VonHeikemen/lsp-zero.nvim",
                config = lsp_zero_config
              },
              "rafamadriz/friendly-snippets",
            },
            config = luasnip_config
          },
        },

        config = cmp_config
      },

      -- Function signatures
      {"ray-x/lsp_signature.nvim",
        opts = lsp_signature_opts
      },
    },

    config = lspconfig_config,

    event = { "BufReadPre", "BufNewFile", "BufAdd" },

    cmd = { "LspInfo", "LspInstall", "LspUninstall" },

    keys = {
      { "<leader>di", "<cmd>lua vim.lsp.buf.hover()<CR>", desc="Información del objeto"}
    }
  }
}
