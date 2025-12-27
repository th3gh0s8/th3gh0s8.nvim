if vim.g.neovide then
  -- Font
  vim.o.guifont = "BigBlueTerm437 Nerd Font:h11"

  -- Smooth scrolling
  vim.g.neovide_scroll_animation_length = 0.2

  -- Cursor animation
  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_size = 0.8

  -- Transparency (optional)
  vim.g.neovide_transparency = 0.95

  -- Padding
  vim.g.neovide_padding_top = 6
  vim.g.neovide_padding_bottom = 6
  vim.g.neovide_padding_left = 6
  vim.g.neovide_padding_right = 6

  -- Disable annoying default behaviors
  vim.g.neovide_confirm_quit = true
end

