local wk = require("which-key")

wk.add({
  -- Window navigation
  {
    mode = { "n", "t" },
    { "<c-h>", "<c-w>h", silent = true },
    { "<c-j>", "<c-w>j", silent = true },
    { "<c-k>", "<c-w>k", silent = true },
    { "<c-l>", "<c-w>l", silent = true },
  },

	{
		mode = { "n", "v" },
		{ "<leader>-", "<cmd>Fyler kind=split_left_most<cr>", desc = "Open Fyler" },
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit", hidden = true },
		{ "<leader>w", "<cmd>w<cr>", desc = "Write", hidden = true },
	},

	{ "<leader>f", group = "FILES" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Help Tags" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

	{
		"<leader><Tab>",
		function()
			require("buffer_manager.ui").toggle_quick_menu()
		end,
		desc = "Buffer Manager",
	},

	{
		mode = { "n", "t" },
		"<c-x>",
		"<cmd>bd!<cr>",
		desc = "Close Buffer",
	},

	{
		"<leader>fm",
		function()
			require("conform").format()
		end,
		desc = "Format file",
	},

	{ "<leader>l", group = "LSP" },
	{ "<leader>ls", vim.lsp.buf.signature_help, desc = "Show Signature" },

	-- Terminal
  { "<leader>t", group = "Terminal" },
	{ "<leader>to", "<cmd>terminal<cr>", desc = "Open Terminal" },

	{ "<leader>c", group = "CODE" },
	{ "<leader>cc", "<cmd>terminal make<cr>", desc = "Compile Code" },
	{ "<leader>cr", "<cmd>terminal make run<cr>", desc = "Run Code" },

	{
		"<leader>?",
		function()
			wk.show({ global = false })
		end,
		desc = "Buffer Local Keymaps (which-key)",
		hidden = true,
	},
})
