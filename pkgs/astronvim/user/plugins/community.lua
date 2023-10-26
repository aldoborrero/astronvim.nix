return {
 "AstroNvim/astrocommunity",
 -- { import = "astrocommunity.completion.copilot-lua" },
 -- { import = "astrocommunity.completion.copilot-lua-cmp" },
 { import = "astrocommunity.colorscheme.catppuccin" },
 { import = "astrocommunity.colorscheme.gruvbox-nvim" },
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
 { import = "astrocommunity.terminal-integration.vim-tpipeline" },
 {
   "ray-x/go.nvim",
   -- don't install go binaries with the plugin
   -- instead we install these with nix: https://github.com/ray-x/go.nvim#go-binaries-install-and-update
   build = "true",
  },
}
