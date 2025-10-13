local wk = require("which-key")

wk.add({
	{
		mode = { "n", "v" },
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit", hidden = true },
		{ "<leader>w", "<cmd>w<cr>", desc = "Write", hidden = true },
	},

	{
		"<leader>?",
		function()
			wk.show({ global = false })
		end,
		desc = "Buffer Local Keymaps (which-key)",
	},
})
