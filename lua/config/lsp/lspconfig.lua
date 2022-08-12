local status_ok_mason, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mason then
	return
end

local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_ok_lspconfig then
	return
end

local servers = {
	"jsonls",
	"sumneko_lua",
	"jedi_language_server",
	"emmet_ls",
	"esbonio",
	"golangci_lint_ls",
	"gopls",
	"grammarly",
	"html",
	"intelephense",
	"jsonls",
	"lemminx",
	"ltex",
	"marksman",
	"rust_analyzer",
	"sqls",
	"bashls",
}

mason_lspconfig.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("config.lsp.handlers").on_attach,
		capabilities = require("config.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
