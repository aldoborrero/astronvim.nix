-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    number = true, -- sets vim.opt.number
    relativenumber = true, -- sets vim.opt.relativenumber
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    spell = false, -- sets vim.opt.spell
    wrap = false, -- sets vim.opt.wrap
  },
  g = {
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    autopairs_enabled = true, -- enable autopairs at start
    cmp_enabled = true, -- enable completion at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    mapleader = " ", -- sets vim.g.mapleader
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
  },
}
