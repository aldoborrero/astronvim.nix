return {
 "AstroNvim/astrocommunity",
 { import = "astrocommunity.colorscheme.catppuccin" },
 { import = "astrocommunity.editing-support.auto-save-nvim" },
 { import = "astrocommunity.editing-support.chatgpt-nvim" },
 { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
 { import = "astrocommunity.pack.bash" },
 { import = "astrocommunity.pack.go" },
 { import = "astrocommunity.pack.lua" },
 { import = "astrocommunity.pack.markdown" },
 { import = "astrocommunity.pack.nix" },
 { import = "astrocommunity.pack.python" },
 { import = "astrocommunity.pack.rust" },
 { import = "astrocommunity.pack.toml" },
 { import = "astrocommunity.pack.yaml" },
 { import = "astrocommunity.project.project-nvim" },
 {
   "ray-x/go.nvim",
   -- don't install go binaries with the plugin
   -- instead we install these with nix: https://github.com/ray-x/go.nvim#go-binaries-install-and-update
   build = "true",
  },
}
