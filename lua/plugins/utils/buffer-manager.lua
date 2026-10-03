return {
	"j-morano/buffer_manager.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("buffer_manager").setup({
			line_keys = "1234567890", -- Atalhos numéricos para pular rápido
			select_menu_item_commands = {
				v = { key = "<C-v>", command = "vsplit" },
				h = { key = "<C-h>", command = "split" },
			},
			focus_alternate_buffer = false,
			loop_nav = true,
			highlight = "Normal:Floating", -- Estética mais limpa
			win_extra_options = {
				winhighlight = "Normal:NormalSB,FloatBorder:FloatBorder",
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "buffer_manager",
			callback = function()
				vim.keymap.set("n", "<S-j>", ":m .+1<CR>==", { buffer = true, silent = true })
				vim.keymap.set("n", "<S-k>", ":m .-2<CR>==", { buffer = true, silent = true })
			end,
		})
	end,
}
