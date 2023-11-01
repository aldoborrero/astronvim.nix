return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "catppuccin",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Configure lsp options
  lsp = {
    config = {
      clangd = {
        cmd = { "clangd", "--offset-encoding=utf-16" },
      },
      vale = {
        cmd = { "vale", "--lsp" },
        filetypes = { "markdown", "text" },
      },
    },

    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          "go",
          "nix",
          "rust",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
      },
      timeout_ms = 1000, -- default format timeout
    },

    -- enable servers that you already have installed without mason
    servers = {
      "bashls",
      "clangd",
      "denols",
      "gopls",
      "lua_ls",
      "marksman",
      "nil_ls",
      "pyright",
      "rust_analyzer",
      "taplo",
      "terraformls",
      "vale",
      "yamlls",
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    -- Disable change detection because it caused nvim to constantly need 3-5% CPU, which is bad for battery life
    change_detection = { enabled = false, },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
}
