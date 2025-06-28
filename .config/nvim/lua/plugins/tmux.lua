return {
  {
    "tmux-plugins/vim-tmux",
    enabled = function()
      return utils.executable("tmux")
    end,
    ft = { "tmux" },
  }
}
