return {
  {
    "ray-x/go.nvim",
  -- don't install go binaries with the plugin
   -- instead we install these with nix: https://github.com/ray-x/go.nvim#go-binaries-install-and-update
   build = "true",
  },
}
