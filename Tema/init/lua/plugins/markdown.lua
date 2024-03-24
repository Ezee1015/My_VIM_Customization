vim.g.table_mode_syntax = 0 -- disable the table syntax for improve speed

return {
  -- Live preview de markdown
  {"iamcco/markdown-preview.nvim",
    build = function ()
      vim.fn["mkdp#util#install"]()
    end,

    -- No se puede hacer `cmd = "MarkdownPreview"` porque una vez cargado
    -- el plugin al llamar a MarkdownPreview, no reconoce el comando hasta
    -- salir y volver a entrar al documento, ya que seguramente habilita
    -- al comando con un `autocmd` que lo carga al entrar en un documento
    -- de Markdown
  },

  "dhruvasagar/vim-table-mode",

  {"mzlogin/vim-markdown-toc",
    lazy = false,
    keys = {
      { '<leader>toc', 'gg:GenTocGFM<CR>', { noremap= true } }
    }
  },

  {'jakewvincent/mkdnflow.nvim',
    config = {
      modules = {
        cmp = true
      },
      links = {
        conceal = true,
        transform_explicit = function(text)
          text = text:gsub(" ", "-")
          text = text:lower()
          -- text = os.date('%Y-%m-%d_')..text
          return(text)
        end
      },
      mappings = {
        MkdnEnter = {{'n', 'v', 'i'}, '<CR>'},
        MkdnTab = false,
        MkdnSTab = false,
        MkdnNextLink = {'n', ']l'},
        MkdnPrevLink = {'n', '[l'},
        MkdnNextHeading = {'n', ']]'},
        MkdnPrevHeading = {'n', '[['},
        MkdnGoBack = {'n', '<BS>'},
        MkdnGoForward = {'n', '<Del>'},
        MkdnCreateLink = false, -- see MkdnEnter
        MkdnCreateLinkFromClipboard = {{'n', 'v'}, '<leader><S-p>'}, -- see MkdnEnter
        MkdnFollowLink = false, -- see MkdnEnter
        MkdnDestroyLink = {'n', '<M-CR>'},
        MkdnTagSpan = {'v', '<M-CR>'},
        MkdnMoveSource = {'n', '<F2>'},
        MkdnYankAnchorLink = {'n', 'yaa'},
        MkdnYankFileAnchorLink = {'n', 'yfa'},
        MkdnIncreaseHeading = {'n', '+'},
        MkdnDecreaseHeading = {'n', '-'},
        MkdnToggleToDo = {{'n', 'v'}, '<leader>ts'},
        MkdnNewListItem = false,
        MkdnNewListItemBelowInsert = {'n', 'o'},
        MkdnNewListItemAboveInsert = {'n', 'O'},
        MkdnExtendList = false,
        MkdnUpdateNumbering = {'n', '<leader>nn'},
        MkdnTableFormat = {'n', '<leader>tf'},
        MkdnTableNextCell = {'i', ']|'},
        MkdnTablePrevCell = {'i', '[|'},
        MkdnTableNextRow = false,
        MkdnTablePrevRow = {'i', '<M-CR>'},
        MkdnTableNewRowBelow = {'n', '<leader>ir'},
        MkdnTableNewRowAbove = {'n', '<leader>iR'},
        MkdnTableNewColAfter = {'n', '<leader>ic'},
        MkdnTableNewColBefore = {'n', '<leader>iC'},
        MkdnFoldSection = {'n', '<leader>f'},
        MkdnUnfoldSection = {'n', '<leader>F'}
      },
      tables = {
        trim_whitespace = true,
        format_on_move = true,
        auto_extend_rows = false,
        auto_extend_cols = false,
        style = {
            cell_padding = 0,
            separator_padding = 0,
            outer_pipes = true,
            mimic_alignment = false
        }
    },
    }
  },

  { "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function ()
      require("headlines").setup({
        markdown = {
          headline_highlights = {
              'Headline1',
              'Headline2',
              'Headline3',
              'Headline4',
              'Headline5',
              'Headline6',
          },
          bullet_highlights = {
              "@text.title.1.marker.markdown",
              "@text.title.2.marker.markdown",
              "@text.title.3.marker.markdown",
              "@text.title.4.marker.markdown",
              "@text.title.5.marker.markdown",
              "@text.title.6.marker.markdown",
          },
          -- bullets = { "◉", "○", "3", "✸", "✿", "6" },
          bullets = { "◉", "◎", "○", "✿", "▶", "⤷" },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          dash_string = "-",
          quote_highlight = "Quote",
          quote_string = "┃",
          -- TO MAKE THE HEADERS TALLER
          fat_headlines = false, -- true
          -- fat_headline_lower_string = "🬂",
          fat_headline_lower_string = "▀",
          fat_headline_upper_string = "▃",
        },
        -- Neorg
        norg = {
          -- headline_highlights = {
          --     'Headline1',
          --     'Headline2',
          --     'Headline3',
          --     'Headline4',
          --     'Headline5',
          --     'Headline6',
          -- },
          headline_highlights = false,
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          dash_string = "-",
          doubledash_highlight = "DoubleDash",
          doubledash_string = "=",
          quote_highlight = "Quote",
          quote_string = "┃",
          fat_headlines = true,
          fat_headline_lower_string = "▀",
          fat_headline_upper_string = "▃",
        }
      }) -- setup()

      vim.api.nvim_set_hl(0, 'Headline1', { fg = '#e90101', bg = '#402626', italic = false })
      vim.api.nvim_set_hl(0, 'Headline2', { fg = '#007df2', bg = '#2e486a', italic = false })
      vim.api.nvim_set_hl(0, 'Headline3', { fg = '#15aabf', bg = '#35545f', italic = true })
      vim.api.nvim_set_hl(0, 'Headline4', { fg = '#1dc13e', bg = '#264026', italic = true })
      vim.api.nvim_set_hl(0, 'Headline5', { fg = '#d96e0f', bg = '#403526', italic = true })
      vim.api.nvim_set_hl(0, 'Headline6', { fg = '#f59f00', bg = '#403d26', italic = true })

    end
  },
}
