return {
    {
        "nvim-telescope/telescope.nvim",
        -- УДАЛИЛИ branch = "0.1.x", чтобы lazy скачал самую свежую master-ветку
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    -- На всякий случай оставляем Treesitter в превью отключенным,
                    -- пока не убедимся, что master-ветка завелась без ошибок.
                    preview = {
                        treesitter = false,
                    }
                }
            })
        end
    }
}

