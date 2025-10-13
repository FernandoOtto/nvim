local wk = require("which-key")

wk.add({
	{
		mode = { "n", "v" },
    { "<leader>-", "<cmd>Oil<cr>", desc = "Open Oil" },
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit", hidden = true },
		{ "<leader>w", "<cmd>w<cr>", desc = "Write", hidden = true },
	},

  -- Telescope
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Help Tags" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

	{
		"<leader>?",
		function()
			wk.show({ global = false })
		end,
		desc = "Buffer Local Keymaps (which-key)",
	},
})
