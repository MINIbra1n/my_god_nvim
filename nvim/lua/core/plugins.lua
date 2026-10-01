-- 1. Автоматическое скачивание lazy.nvim, если его нет на компьютере
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Запуск lazy.nvim и сканирование папок с плагинами
require("lazy").setup({
    { import = "plugins.colors" },        -- Просканирует файлы в lua/plugins/ (autoclose, lualine и т.д.)
    { import = "plugins" }, 
  }, {
    checker = { enabled = false }  -- Отключаем назойливые уведомления об обновлениях
})

