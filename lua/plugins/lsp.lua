-- 返回一个插件配置表，通常用于 lazy.nvim 的 plugins 目录
return {
  -- ============================================================================
  -- 1. Mason.nvim
  -- 作用：跨平台的 LSP、DAP、Linter、Formatter 包管理器
  -- 它负责下载和管理外部二进制工具（如 clangd, nodejs, pyright 等）
  -- ============================================================================
  {
    "williamboman/mason.nvim",
    -- 安装或更新插件时执行的命令，确保 Mason 自身的包 registry 是最新的
    build = ":MasonUpdate",
    config = function()
      -- 初始化 Mason
      require("mason").setup()
    end,
  },

  -- ============================================================================
  -- 2. Mason-lspconfig.nvim
  -- 作用：连接 Mason 和 lspconfig 的桥梁
  -- 它确保 Mason 安装的服务器能自动被 lspconfig 识别和启动
  -- ============================================================================
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- 确保这些 LSP 服务器已安装。如果未安装，Mason 会自动下载
        -- 这里指定了 C/C++ (clangd), CMake (cmake), Bash (bashls)
        ensure_installed = { "clangd", "cmake", "bashls" },
      })
    end,
  },

  -- ============================================================================
  -- 3. Nvim-lspconfig (及 Neovim 0.10+ 新 API)
  -- 注意：虽然注释说“使用原生 API"，但实际仍依赖此插件提供服务器配置定义。
  -- vim.lsp.config 是 Neovim 0.10+ 引入的新接口风格（替代旧的 require('lspconfig').xxx.setup()）
  -- ============================================================================
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- ------------------------------------------------------------------------
      -- 配置具体的 LSP 服务器 (以 clangd 为例)
      -- 注意：vim.lsp.config 需要 Neovim 0.10 及以上版本
      -- ------------------------------------------------------------------------
      vim.lsp.config("clangd", {
        -- 自定义启动命令和参数
        cmd = {
          "clangd",
          "--background-index",       -- 在后台建立索引，加速跳转和搜索
          "--clang-tidy",             -- 启用 clang-tidy 进行代码检查和 lint
          "--header-insertion=iwyu",  -- Include What You Use: 自动添加/移除头文件
          "--completion-style=detailed", -- 提供更详细的自动补全信息
          "--fallback-style=llvm",    -- 代码格式化回退风格为 LLVM
        },
      })

      -- ------------------------------------------------------------------------
      -- 配置 LSP 快捷键
      -- 使用 LspAttach 自动命令：确保只有在 LSP 成功附加到缓冲区时才设置快捷键
      -- 这样可以避免在没有 LSP 的文件中占用快捷键，且保证快捷键是缓冲区局部的
      -- ------------------------------------------------------------------------
      vim.api.nvim_create_autocmd("LspAttach", {
        -- 创建一个自动命令组，方便后续管理或清除
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- 获取当前触发事件的缓冲区编号
          local bufnr = ev.buf
          
          -- 定义一个辅助函数用于设置缓冲区局部的快捷键
          -- keys: 快捷键 (如 "gd")
          -- func: 执行的函数 (如 vim.lsp.buf.definition)
          -- desc: 描述信息 (用于 which-key 等插件显示)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
          end

          -- [G]oto [D]efinition: 跳转到定义（垂直分窗）
          map("gd", function()
            vim.cmd("vsplit")
            vim.lsp.buf.definition()
          end, "[G]oto [D]efinition (Vertical)")
              
          -- [G]oto [R]eferences: 查找引用
          map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
          
          -- Hover Documentation: 悬停显示文档/类型信息
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          
          -- [C]ode [A]ction: 代码动作 (如自动修复、导入等)
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          
          -- [R]e[n]ame: 重命名符号
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          
          -- Show [D]iagnostics: 显示当前行的诊断信息 (错误/警告)
          map("<leader>d", vim.diagnostic.open_float, "Show [D]iagnostics")
        end,
      })
    end,
  },
}

