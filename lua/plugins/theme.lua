return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- 调用插件自带的 setup 函数进行配置
    require("tokyonight").setup({
      style = "storm",        -- 可选：night, storm, day, moon
      transparent = true,     -- 是否开启背景透明
      styles = {              -- 样式设置
        comments = { italic = true }, -- 注释用斜体
        keywords = { italic = true }, -- 关键字用斜体
      },
    })
    
    -- 应用主题
    vim.cmd([[colorscheme tokyonight]])
  end,
}

