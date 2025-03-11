local capabilities = require("cmp_nvim_lsp").default_capabilities()
local util = require("lspconfig.util")

local function get_clangd_path()
	local current_dir = vim.fn.getcwd()
	if current_dir:find("/esp") then
		return vim.fn.getenv("HOME") .. "/Documents/STU/LS/TP/esp-clang/bin/clangd"
	else
		return "clangd"
	end
end

return {
	cmd = {
		get_clangd_path(),
		"--all-scopes-completion",
		"--background-index",
		"--clang-tidy",
		"--compile_args_from=filesystem", -- lsp-> does not come from compie_commands.json
		"--completion-parse=always",
		"--completion-style=bundled",
		"--debug-origin",
		"--enable-config", -- clangd 11+ supports reading from .clangd configuration file
		"--fallback-style=Qt",
		"--function-arg-placeholders",
		"--header-insertion=iwyu",
		"--pch-storage=memory", -- could also be disk
		"-j=4",		-- number of workers
		-- "--resource-dir="
		"--log=error",
		--[[ "--query-driver=/usr/bin/g++", ]]
	},
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = util.root_pattern(
		'.clangd',
		'.clang-tidy',
		'.clang-format',
		'build.sh', -- buildProject
		'compile_commands.json',
		'compile_flags.txt',
		'configure.ac', -- AutoTools
		'run',
		'compile'
	),
	single_file_support = true,
	init_options = {
		compilationDatabasePath = vim.fn.getcwd(),
	},
	capabilities = capabilities,
	commands = {},
}
