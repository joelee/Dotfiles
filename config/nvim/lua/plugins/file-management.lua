-- File Management explorer
-- https://github.com/stevearc/oil.nvim_lsp

return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup({
      default_file_explorer = false,
      columns = {
        "icon",
        "size",
        "mtime",
      },
      delete_to_trash = true,
    })
    vim.keymap.set("n", "-", oil.toggle_float, {})
  end,
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  lazy = false,
}

