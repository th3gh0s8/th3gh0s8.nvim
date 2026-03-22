return{
  "vimwiki/vimwiki",
  config = function()
    -- Optional: Vimwiki configuration
    vim.g.vimwiki_list = {
      {
        path = vim.fn.expand('~') .. '/vimwiki/',
        syntax = 'markdown',
        ext = '.md',
      }
    }
end
}
