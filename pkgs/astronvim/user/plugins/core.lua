return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },
  -- customize gitsigns options
  {
    "gitsigns.nvim",
    opts = function(_, opts)
      opts.current_line_blame = true
      return opts
    end,
  },
  -- customize neo-tree options
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      follow_current_file = true,
    },
  },
  -- override make command build since we provide the shared library with home-manager already
  { "nvim-telescope/telescope-fzf-native.nvim", build = "true", },
  -- disable building since it's optional
  { "L3MON4D3/LuaSnip", build = "true", },
}
