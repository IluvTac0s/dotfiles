return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files",
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Search text",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "Find buffers",
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Search help",
      },
    },
    opts = {},
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
