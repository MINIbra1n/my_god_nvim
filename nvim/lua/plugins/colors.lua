return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,    -- Загружать тему сразу при старте Neovim
        priority = 1000, -- Высокий приоритет (загрузится раньше остальных плагинов)
        config = function()
            vim.cmd("colorscheme kanagawa") -- Включаем саму тему
        end
    }
}
