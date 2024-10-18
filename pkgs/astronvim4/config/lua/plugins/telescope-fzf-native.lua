---@type LazySpec
return {
	-- override make command build since we provide the shared library with nix
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "true" },
}
