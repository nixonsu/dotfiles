-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- only source if ~/.vimrc actually exists
if vim.fn.filereadable(vim.fn.expand("~/.vimrc")) == 1 then
  vim.cmd("source " .. vim.fn.expand("~/.vimrc"))
end
