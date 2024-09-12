--vim.g.tokyonight_style = "night"
--vim.opt.background = "dark"

--vim.cmd("colorscheme tokyonight")

require("tokyonight").setup({
	-- style = "night",
	style = "storm",
	transparent = true,
	terminal_colors = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
		sidebars = "dark",
		floats = "dark",
		-- sidebars = "transparent",
		-- floats = "transparent",
	},
})

require("rose-pine").setup({
	disable_background = true,
	styles = {
		italic = false,
	},
})

require("kanagawa").setup({
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
})

-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme kanagawa-wave")
vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme kanagawa-lotus")
