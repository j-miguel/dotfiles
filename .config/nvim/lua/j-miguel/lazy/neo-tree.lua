return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	init = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			-- make a group to be able to delete it later
			group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
			callback = function()
				local f = vim.fn.expand("%:p")
				if vim.fn.isdirectory(f) ~= 0 then
					vim.cmd("Neotree current dir=" .. f)
					-- neo-tree is loaded now, delete the init autocmd
					vim.api.nvim_clear_autocmds({ group = "NeoTreeInit" })
				end
			end,
		})
		vim.keymap.set("n", "<leader>o", ":Neotree toggle<CR>", {})
		vim.keymap.set("n", "<leader>op", ":Neotree reveal<CR>", {})
	end,

	opts = {
		-- sort_function = function(node_a, node_b)
		-- 	if node_a.type == "directory" and node_b.type ~= "directory" then
		-- 		return false
		-- 	elseif node_a.type ~= "directory" and node_b.type == "directory" then
		-- 		return true
		-- 	else
		-- 		return node_a.name < node_b.name
		-- 	end
		-- end,
		sort_function = function(a, b)
			if a.type == b.type then
				return a.path < b.path
			else
				return a.type > b.type
			end
		end, -- this sorts files and directories descendantly
		filesystem = {
			follow_current_file = { enabled = true },
			hijack_netrw_behavior = "open_current",
		},
		window = {
			position = "right",
		},
	},
}
