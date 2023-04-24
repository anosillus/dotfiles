local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local f = null_ls.builtins.formatting
local d = null_ls.builtins.diagnostics
local a = null_ls.builtins.code_actions
local c = null_ls.builtins.completion

local sources = {
	c.spell,
	c.luasnip,
	c.tags,
	f.deno_fmt,
	f.prettier.with({ filetypes = { "html", "markdown", "css" } }),
	f.stylua,
	-- f.luaformatter,
	d.luacheck,
	-- Action
	a.refactoring,
	d.trail_space,
	f.trim_whitespace,
	d.mypy,

	-- cpp
	f.clang_format,
	d.textlint.with({ timeout = 20000 }),
	d.hadolint,
	d.markdownlint,
	f.fish_indent,
	f.gofmt,
	f.shfmt,
	f.sql_formatter,
	f.terrafmt,
	f.terraform_fmt,
	f.xmlformat,
	f.rustfmt,
	f.ruff,
	f.black,
	f.reorder_python_imports,
}

null_ls.setup({
	-- diagnostics_format = "#{m} (#{s}: #{c})",
	diagnostics_format = "#{m}",
	debug = true,
	sources = sources,
})
