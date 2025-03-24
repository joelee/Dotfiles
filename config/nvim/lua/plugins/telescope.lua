-- https://github.com/nvim-telescope/telescope.nvim

return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            theme = "ivy",
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          fzf = {}
        }
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind [S]tring in files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers on opened files" })
      vim.keymap.set("n", "<leader>fp", builtin.oldfiles, { desc = "[F]ind [P]reviously opened files" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp tags" })
      vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "[F]ind [C]ommands" })

      require("telescope").load_extension("ui-select")
    end,
  },
}

