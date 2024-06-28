---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require("null-ls")

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- bash
      null_ls.builtins.formatting.shfmt.with({
        args = { "-i", "2" },
      }),

      -- html/css/js/ts/json/yaml/xml/markdown
      null_ls.builtins.formatting.prettier,

      -- go
      null_ls.builtins.code_actions.impl,
      null_ls.builtins.diagnostics.golangci_lint,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.goimports,

      -- lua
      null_ls.builtins.formatting.stylua,

      -- nix
      null_ls.builtins.formatting.alejandra,

      -- python
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.ruff,

      -- rust
      null_ls.builtins.formatting.rustfmt,

      -- terraform
      null_ls.builtins.formatting.terraform_fmt,
    }
    return config -- return final config table
  end,
}
