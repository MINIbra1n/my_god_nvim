return {

    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- Нужен для иконок файлов
        "MunifTanjim/nui.nvim",         -- Обязательный UI-компонент для neo-tree
    },
    config = function()
        require("neo-tree").setup({
            -- Здесь задаются настройки для neo-tree (например, положение, фильтры и т.д.)
            window = {
                width = 30,
            }
        })
    end
}

