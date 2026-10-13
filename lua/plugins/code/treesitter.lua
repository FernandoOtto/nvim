return {

	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		local languages = {
			"c",
			"cpp",
			"lua",
			"rust",
			"python",
			"zig",
			"html",
			"css",
			"typescript",
			"make",
			"java",
		}

		require("nvim-treesitter").install(languages)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = languages,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
