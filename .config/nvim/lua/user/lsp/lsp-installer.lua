local lspconfig = require("lspconfig")

require("nvim-lsp-installer").setup({
    ensure_installed = { "rust_analyzer", "lua_ls", "tsserver", "jsonls" }, -- ensure these servers are always installed
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    },
    log_level = vim.log.levels.DEBUG
})

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

local jsonls_opts = vim.tbl_deep_extend("force", require("user.lsp.settings.jsonls"), opts)
local sumneko_opts = vim.tbl_deep_extend("force", require("user.lsp.settings.sumneko_lua"), opts)
local pyright_opts = vim.tbl_deep_extend("force", require("user.lsp.settings.pyright"), opts)
--local tsserver_opts = vim.tbl_deep_extend("force", require("user.lsp.settings.tsserver"), opts)

lspconfig.jsonls.setup(jsonls_opts)
--lspconfig.sumneko_lua.setup(sumneko_opts)
lspconfig.lua_ls.setup(sumneko_opts)
lspconfig.pyright.setup(pyright_opts)
lspconfig.tsserver.setup {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
	--root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git") or vim.loop.cwd(),
  root_dir = lspconfig.util.root_pattern("tsconfig.json") or vim.loop.cwd(),
}
