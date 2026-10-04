return {
  {
    "unrealjo/neovim-purple",
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.cmd.colorscheme("neovim_purple")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}
