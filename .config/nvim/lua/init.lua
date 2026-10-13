require'barbar'.setup {
	tabpages = false,
	clickable = false,
	icons = {
		filetype = { enabled = false },
		button = '',
		modified = { button = '+' }
	}
}

require("claudecode").setup {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  terminal = {
	  split_side = "bottom",
	  split_width_percent = 0.3
  }
}
