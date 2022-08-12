local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local defaults = {
    cmd = { "nvim" },
    debounce = 250,
    debug = false,
    default_timeout = 5000,
    diagnostics_format = "#{m}",
    fallback_severity = vim.diagnostic.severity.ERROR,
    log_level = "warn",
    notify_format = "[null-ls] %s",
    on_attach = nil,
    on_init = nil,
    on_exit = nil,
--    root_dir = u.root_pattern(".null-ls-root", "Makefile", ".git"),
    sources = nil,
    update_in_insert = false,
}

local code_actions = null_ls.builtins.code_actions
-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics
-- formatting sources
local formatting = null_ls.builtins.formatting
-- hover sources
local hover = null_ls.builtins.hover
-- completion sources
local completion = null_ls.builtins.completion

null_ls.setup({
    defaults,
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
        formatting.isort,
		formatting.stylua,
        diagnostics.flake8,
        diagnostics.mypy,
        code_actions.gitsigns,
        completion.spell,
	},
})
