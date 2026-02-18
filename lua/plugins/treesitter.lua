return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- 使用 pcall 安全加载，即使失败也不会崩溃
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      -- 如果加载失败，静默返回，不报错
      return
    end
    
    -- 再次安全检查 setup 函数是否存在
    if not configs.setup then
      return
    end
    
    configs.setup({
      ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
