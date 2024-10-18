---@type LazySpec
return {
	{
		"https://git.sr.ht/~swaits/scratch.nvim",
		opts = {
			keys = {
				{ "<leader>bs", "<cmd>Scratch<cr>", desc = "Scratch Buffer", mode = "n" },
				{ "<leader>bS", "<cmd>ScratchSplit<cr>", desc = "Scratch Buffer (split)", mode = "n" },
			},
			cmd = {
				"Scratch",
				"ScratchSplit",
			},
		},
	},
}
