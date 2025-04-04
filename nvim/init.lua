-- FILE PATH: C:\Users\ledan\AppData\Local\nvim --
--
--
-- Khởi tạo Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Cấu hình plugin với lazy
require("lazy").setup({
    -- Cài đặt nvim-tree và các dependencies
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
        "nvim-tree/nvim-web-devicons",
        },
        config = function()
        -- Cấu hình nvim-tree cơ bản
        require("nvim-tree").setup {
            sort_by = "case_sensitive",
            view = {
            adaptive_size = true,
            },
            renderer = {
            group_empty = true,
            },
        }
        end,
    },
    -- NVIM TREESITTER
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'lua', 'vim', 'javascript', 'typescript', 'html', 'css', 'markdown'}, -- Các ngôn ngữ bạn muốn cài
            highlight = { enable = true },
            indent = { enable = true },
            -- enable folding (requires 'foldexpr')
            fold = { enable = true },
        })
        end,
    },
    -- STATUS LINE 
    {
        'nvim-lualine/lualine.nvim',
        config = function()
        require('lualine').setup({
            options = {
                -- Available themes in C:\Users\ledan\AppData\Local\nvim-data\lazy\lualine.nvim\lua\lualine\themes
                theme = 'dracula'
            }
        })
        end
    },
    -- TAB LINE
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
        require("bufferline").setup{
            options = {
                -- mode = "tabs", -- or "buffers"
                separator_style = "slant", -- or "thick", "thin", { 'any', 'any' },
                indicator_style = 'underline', -- or 'none', 'icon', 'line'
                buffer_close_icon = '',
                modified_icon = '●',
                -- close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                max_name_length = 14,
                max_prefix_length = 13,
                tab_size = 13,
                -- ... các tùy chọn khác
            }
        }
        end
    },
    -- FLOAT TERMINAL 
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup()
        end
    }
})


vim.g.mapleader = " " -- Đặt leader key là phím Space
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle nvim-tree',  silent = true  })
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { desc = 'Toggle terminal',  silent = true  })
vim.opt.number = true 

-- TRANSPARENT VIM --
vim.cmd [[
  highlight Normal guibg=none ctermbg=none
  highlight NormalNC guibg=none ctermbg=none
  highlight SignColumn guibg=none ctermbg=none
  highlight LineNr guibg=none ctermbg=none
  highlight CursorLine guibg=none ctermbg=none
  highlight CursorLineNr guibg=none ctermbg=none
]]