local function map(mode, lhs, rhs, desc_or_opts)
  local opts = {}

  if type(desc_or_opts) == "string" then
    opts = { desc = desc_or_opts }
  elseif type(desc_or_opts) == "table" then
    opts = desc_or_opts
  end
  opts.silent = opts.silent ~= false

  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Лидер-клавиша (Пробел)
vim.g.mapleader = " " 

-- =======================================================================
-- ИСПРАВЛЕННЫЕ ГОРЯЧИЕ КЛАВИШИ ДЛЯ TELESCOPE (ЧЕРЕЗ ВАШУ ФУНКЦИЮ map)
-- =======================================================================

-- Используем чистые Lua-функции внутри вашей map() — это самый надежный способ!
map("n", "<leader>ff", function() require('telescope.builtin').find_files() end, "Поиск файлов")
map("n", "<leader>fg", function() require('telescope.builtin').live_grep() end, "Поиск текста по проекту")
map("n", "<leader>fb", function() require('telescope.builtin').buffers() end, "Поиск по открытым буферам")
map("n", "<leader>fh", function() require('telescope.builtin').oldfiles() end, "История старых файлов")
map("n", "<leader>f?", function() require('telescope.builtin').help_tags() end, "Поиск по документации")
map("n","<leader>e",function()require('neo-tree.command').execute({toggle = true}) end,{silent=true})
