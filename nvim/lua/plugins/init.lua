return {
   -- 1. Статусная строка внизу экрана (Lualine)
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({ options = { theme = "kanagawa" } })
        end,
    },

    -- 2. Умное автозакрытие скобок и кавычек
    {
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup()
        end,
    },

    -- 3. Мощный поиск файлов и текста (Telescope)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = { preview = { treesitter = false } }
            })
        end,
    },

    -- 4. Подсветка синтаксиса (Treesitter) — адаптировано под Neovim 0.12+
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
            local ts_install = require("nvim-treesitter.install")
            ts_install.prefer_git = true
        end,
    },

{
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- Гарантируем, что модуль автодополнения загружен
    config = function()
        -- Подготавливаем возможности для автоподстановки
        local capabilities = {}
        local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
        if has_cmp then
            capabilities = cmp_lsp.default_capabilities()
        end

        if vim.lsp.config then
            -- Новый способ запуска gopls для Neovim 0.12+
            vim.lsp.config("gopls", {
                cmd = { "/home/pustoy/go/bin/gopls" }, 
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_markers = { "go.work", "go.mod", ".git" },
                capabilities = capabilities, -- Передаем capabilities сюда
                settings = {
                    gopls = {
                        analyses = { unusedparams = true },
                        staticcheck = true,
                    },
                },
            })
            vim.lsp.enable("gopls")
        else
            -- Резервный вариант для старых версий
            local lspconfig = require("lspconfig")
            lspconfig.gopls.setup({
                cmd = { "/home/pustoy/go/bin/gopls" }, 
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
                capabilities = capabilities, -- И сюда
            })
        end

        -- Исправленное форматирование при сохранении (синхронное, чтобы успело до записи файла)
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end,
},

{
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",     -- Источник подсказок из LSP
        "hrsh7th/cmp-buffer",       -- Подсказки из текущего файла
        "hrsh7th/cmp-path",         -- Подсказки путей
        "L3MON4D3/LuaSnip",         -- Движок сниппетов (обязателен для nvim-cmp)
        "saadparwaiz1/cmp_luasnip", -- Мост для сниппетов
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- Настройка горячих клавиш в меню автоподстановки
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(), -- Вызвать меню вручную
                ['<C-e>'] = cmp.mapping.abort(),        -- Закрыть меню
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Подтвердить выбор (Enter)
            }),
            -- Источники, откуда cmp берет данные для подсказок
            sources = cmp.config.sources({
                { name = 'nvim_lsp' }, -- Подсказки от gopls
                { name = 'luasnip' },  -- Сниппеты
            }, {
                { name = 'buffer' },   -- Текст из текущего файла
                { name = 'path' },     -- Пути к файлам
            })
        })
    end
}
}



    -- 5. Настройка встроенного LSP клиента Neovim для работы с системным gopls

