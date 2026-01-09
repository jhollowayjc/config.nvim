return {
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  { "catppuccin/nvim",             name = "catppuccin", priority = 1000, },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  { "numToStr/Comment.nvim",       opts = {} },
  { "j-hui/fidget.nvim",           opts = {} },
  { "echasnovski/mini.statusline", version = "*",       opts = {} },
  { "lewis6991/gitsigns.nvim",     opts = {} },
  { "nvim-mini/mini.icons",        version = "*" },
  { 'OXY2DEV/markview.nvim' },
}
