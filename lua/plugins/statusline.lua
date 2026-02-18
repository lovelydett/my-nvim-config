return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 
    "nvim-tree/nvim-web-devicons" -- 依赖图标插件（第三步已安装，这里声明依赖关系）
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight", -- 使用和我们主题一致的颜色方案
        icons_enabled = true, -- 开启图标
        component_separators = { left = "", right = "" }, -- 分隔符样式
        section_separators = { left = "", right = "" }, -- 区块分隔符样式
        disabled_filetypes = { "neo-tree" }, -- 在 Neo-tree 窗口中不显示状态栏
      },
      sections = {
        lualine_a = { "mode" }, -- 模式 (NORMAL, INSERT...)
        lualine_b = { "branch", "diff", "diagnostics" }, -- Git 分支，差异，错误数
        lualine_c = { "filename" }, -- 文件名
        lualine_x = { "encoding", "fileformat", "filetype" }, -- 编码，格式，文件类型
        lualine_y = { "progress" }, -- 进度百分比
        lualine_z = { "location" }, -- 行列号
      },
    })
  end,
}

