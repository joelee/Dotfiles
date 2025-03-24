-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {
          'bash', 'c', 'cpp', 'css', 'diff', 'editorconfig', 
          'lua', 'vim', 'vimdoc', 'query', 'markdown', 'rust',
          'python', 'yaml', 'json', 'go', 'fish', 'markdown_inline',
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
