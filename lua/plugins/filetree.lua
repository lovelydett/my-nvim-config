return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x", -- 使用稳定分支
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- 文件图标
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree", -- 只在输入 :Neotree 命令时加载
  keys = { 
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle File Explorer" } 
  },
  config = function()
    -- 关闭旧版命令警告
    vim.cmd([[let g:neo_tree_remove_legacy_commands = 1]])
    
    require("neo-tree").setup({
      close_if_last_window = true, -- 如果它是最后一个窗口，关闭时退出 Neo-tree
      popup_border_style = "rounded", -- 弹窗圆角
      enable_git_status = true,      -- 显示 Git 状态 (红/绿点)
      enable_diagnostics = true,     -- 显示错误警告图标
      source_selector = {
        winbar = true, -- 在顶部显示来源选择器 (files, git_status, buffers)
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
      window = {
        mappings = {
          ["<BS>"] = "close_node",
        },
      },
    })
  end,
}

