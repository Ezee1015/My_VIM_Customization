return {
	-- Comentar lineas de código
	{"numToStr/Comment.nvim",
    config = {
      toggler = { -- LHS of toggle mappings in NORMAL mode
        line = 'gcc', -- Line-comment toggle keymap
        block = 'gbb', -- Block-comment toggle keymap
      },
    }
  }
}
