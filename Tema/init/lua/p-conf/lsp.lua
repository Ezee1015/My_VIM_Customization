local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

vim.opt.completeopt= "menu,menuone,noselect"

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local cmp = require'cmp'
local luasnip = require'luasnip'
--     פּ  ﯟ  m    some other good icons
local kind_icons = {
  Text = "",
  Method = "m ",
  Function = " ",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
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

        buffer = "- Buffer",
        path = "- Path",
      })[entry.source.name]
    return vim_item
  end,
}
  })
-- Indica parametros de una funcion a la vez que se escribe
require'lsp_signature'.setup({
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
})

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
-- Muestra el mensaje de error cuando se mantiene el cursor quieto
vim.diagnostic.config({
  virtual_text = true
})
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Lua-Language-Server
require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Quita los mensaje molestos cada vez que abro un archivo .lua
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
