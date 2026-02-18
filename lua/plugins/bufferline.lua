return {
  "akinsho/bufferline.nvim",
  dependencies = { 
    "nvim-tree/nvim-web-devicons"  -- 需要图标支持
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",          -- 显示缓冲区（打开的文件）
        style_preset = {
          require("bufferline").style_preset.no_italic,
        },
        themable = true,           -- 允许主题覆盖颜色
        numbers = "none",          -- 不显示序号
        close_command = "bdelete! %d",  -- 关闭标签的命令
        right_mouse_command = "bdelete! %d", -- 右键关闭
        left_mouse_command = "buffer %d",  -- 左键切换
        middle_mouse_command = nil,
        indicator = {
          icon = "▎",              -- 选中指示器
          style = "icon",
        },
        buffer_close_icon = "",   -- 关闭按钮图标
        modified_icon = "●",       -- 修改状态图标
        close_icon = "",          -- 关闭图标
        left_trunc_marker = "",   -- 左侧截断标记
        right_trunc_marker = "",  -- 右侧截断标记
        diagnostics = "nvim_lsp",  -- 显示 LSP 诊断（错误/警告）
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and "  " or "  "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
        show_buffer_icons = true,   -- 显示文件图标
        show_buffer_close_icons = true, -- 显示关闭按钮
        show_close_icon = true,
        show_tab_indicators = true, -- 显示 tab 指示器
        persist_buffer_sort = true, -- 保持排序
        separator_style = "thin",   -- 分隔符样式：thin|thick|slant|...
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        sort_by = "insert_after_current", -- 新缓冲区排序方式
      },
    })
    
    -- 设置快捷键
    local map = vim.keymap.set
    map("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
    map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
    map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Pin Buffer" })
    map("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Close Non-Pinned" })
    map("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close Others" })
    map("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Close Right" })
    map("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Close Left" })
  end,
}

