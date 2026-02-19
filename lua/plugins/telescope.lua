-- =============================================================================
-- Telescope 插件配置
-- 功能：项目级模糊搜索、文件搜索、字符串搜索等
-- =============================================================================

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",  -- 使用稳定版本
  dependencies = {
    "nvim-lua/plenary.nvim",  -- 依赖：通用工具函数
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- 映射按键
        mappings = {
          i = {  -- 插入模式下的按键
            ["<C-k>"] = actions.move_selection_previous,  -- 上一个结果
            ["<C-j>"] = actions.move_selection_next,      -- 下一个结果
            ["<CR>"] = actions.select_default,            -- 确认选择
            ["<C-v>"] = actions.select_vertical,          -- 垂直分屏打开
            ["<C-x>"] = actions.select_horizontal,        -- 水平分屏打开
            ["<C-t>"] = actions.select_tab,               -- 新标签页打开
            ["<Esc>"] = actions.close,                    -- 关闭
          },
          n = {  -- 正常模式下的按键
            ["q"] = actions.close,  -- 按 q 关闭
          },
        },
        -- 搜索行为
        file_ignore_patterns = { "node_modules", ".git", "build", "dist" },  -- 忽略的目录
        previewer = true,  -- 启用预览窗口
        sorting_strategy = "ascending",  -- 排序策略
        layout_strategy = "horizontal",  -- 布局策略
        layout_config = {
          horizontal = {
            preview_width = 0.55,  -- 预览窗口宽度
          },
        },
      },
    })

    -- =============================================================================
    -- Telescope 快捷键配置
    -- =============================================================================
    local map = vim.keymap.set

    -- 项目级字符串搜索（最常用！）
    -- 使用场景：搜索整个项目中的某个函数名、变量名、字符串
    -- 操作方式：空格 + s + g (search grep)
    map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "Search String in Project" })

    -- 搜索文件（按文件名）
    -- 使用场景：知道文件名，想快速打开
    -- 操作方式：空格 + s + f (search file)
    map("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Search Files" })

    -- 搜索已打开的缓冲区
    -- 使用场景：在已打开的文件中搜索
    -- 操作方式：空格 + s + b (search buffer)
    map("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "Search Buffers" })

    -- 搜索帮助文档
    -- 使用场景：查找 Vim/Neovim 帮助
    -- 操作方式：空格 + s + h (search help)
    map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "Search Help" })

    -- 查看命令历史
    -- 使用场景：查找之前执行过的命令
    -- 操作方式：空格 + s + c (search command)
    map("n", "<leader>sc", "<cmd>Telescope command_history<CR>", { desc = "Search Command History" })

    -- 查看搜索历史
    -- 使用场景：查找之前搜索过的关键词
    -- 操作方式：空格 + s + s (search search)
    map("n", "<leader>ss", "<cmd>Telescope search_history<CR>", { desc = "Search Search History" })

    -- 查找 Git 提交记录（如果在 Git 仓库中）
    -- 使用场景：查看项目提交历史
    -- 操作方式：空格 + s + g + c
    map("n", "<leader>sgc", "<cmd>Telescope git_commits<CR>", { desc = "Search Git Commits" })

    -- 查找 Git 状态（修改的文件）
    -- 使用场景：查看哪些文件被修改了
    -- 操作方式：空格 + s + g + s
    map("n", "<leader>sgs", "<cmd>Telescope git_status<CR>", { desc = "Search Git Status" })

    -- 查找项目中的 TODO/FIXME 注释
    -- 使用场景：快速定位待办事项
    -- 操作方式：空格 + s + t (search todo)
    map("n", "<leader>st", "<cmd>Telescope grep_string search=TODO<CR>", { desc = "Search TODO" })
  end,
}

