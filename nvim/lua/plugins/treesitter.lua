return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            -- Альтернативная прямая настройка без вызова сломанного модуля configs
            local ts = require("nvim-treesitter.install")
            ts.prefer_git = true
            
            -- Включаем встроенную подсветку Treesitter для текущего окна
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}

