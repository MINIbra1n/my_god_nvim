local opt = vim.opt



opt.expandtab = true --  Преобразовать табы в пробелы

opt.smarttab = true -- Умная вставка табов

opt.smartindent = true -- Автоматические отступы

opt.tabstop = 2 -- Какой ширины выглядит символ таба в файле

opt.softtabstop = 2 -- На сколько колонок двигает/удаляет Tab и Backspace

opt.shiftwidth = 2  -- Размер отступа для >> и <<
opt.ignorecase = true -- Игнорировать регистр при поиске
opt.smartcase = true -- Но учитывать, если в запросе есть заглавные буквы

opt.number = true -- Показывать номера строк
opt.relativenumber = true -- Показывать номера строк относительно текущей строки
opt.numberwidth = 2 

opt.fillchars = {eob = " "}


opt.termguicolors = true -- Поддержка 24-bit цветов
opt.mouse = "a" -- Включить мышь во всех режимах
opt.wrap = true -- Автоматический перенос длинных строк


-- files and buferes 
opt.undofile = true -- Сохранять историю отмен между сессиями
opt.swapfile = false -- Отключить swap-файлы (они раздражают)
opt.fileencoding = "utf-8" -- Кодировка файлов
opt.clipboard = "unnamedplus" -- Использовать системный буфер обмена

