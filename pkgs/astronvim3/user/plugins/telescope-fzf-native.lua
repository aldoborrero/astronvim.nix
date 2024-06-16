return {
  -- override make command build since we provide the shared library with home-manager already
  { "nvim-telescope/telescope-fzf-native.nvim", build = "true", },
}
