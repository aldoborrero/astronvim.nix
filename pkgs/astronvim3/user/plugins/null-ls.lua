return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- lua
      null_ls.builtins.formatting.stylua,

      -- html/css/js/ts/json/yaml/xml/markdown
      null_ls.builtins.formatting.prettier,

      -- go
      null_ls.builtins.code_actions.impl,
      null_ls.builtins.diagnostics.golangci_lint,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.goimports,

      -- nix
      null_ls.builtins.formatting.alejandra,

      -- python
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.ruff,

      -- rust
      null_ls.builtins.formatting.rustfmt,

      -- bash
      null_ls.builtins.formatting.shfmt.with {
        args = { "-i", "2" },
      },
    }
    return config -- return final config table
  end,
}
