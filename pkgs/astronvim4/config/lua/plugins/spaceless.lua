---@type LazySpec
return {
	{
		-- strip spaces automatically
		"lewis6991/spaceless.nvim",
		init = function()
			require("spaceless").setup()
		end,
	},
}
