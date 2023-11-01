-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- normal mode
  n = {
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },

    -- close buffer with picker
    ["<leader>bx"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick buffer to close",
    },

    ["<leader><leader>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
  },
  -- terminal mode
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  -- ex commands
  c = {
    ["w!!"] = { "w !sudo tee > /dev/null %", desc = "Write as sudo" },
  }
}
