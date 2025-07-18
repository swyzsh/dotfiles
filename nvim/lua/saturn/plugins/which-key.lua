return {
	"folke/which-key.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ "echasnovski/mini.nvim", version = false },
	},
	event = "VeryLazy",
	opts = {
		preset = "helix",
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	-- Icons that are recognized by text inside a group name:
	-- IF THE Parent group has a icon like this, its child has them too unless specified by another text
	-- File
	-- Buffer
	-- Diagnostics
	-- Git
	-- Search
	-- Toggle
	-- Debug
	-- Format
	-- Code
	config = function(_, opts)
		local wk = require("which-key")

		wk.add({
			-- Group: Buffer
			{ "<leader>b", icon = "", group = "Buffers" },
			{ "<leader>bb", icon = "  ", group = " Recent buffer" },
			{ "<leader>bl", icon = "  ", group = " List all buffers" },
			{ "<leader>bd", icon = " 󰗨 ", group = " Delete buffer" },
			{ "<leader>b[", icon = "  ", group = " Previous buffer" },
			{ "<leader>b]", icon = "  ", group = " Next buffer" },
			{ "<leader>bs", icon = "  ", group = " Split w/ next buffer" },
			{ "<leader>bw", icon = "  ", group = " Wipeout buffer" },

			-- Group: Tabs
			{ "<leader>t", icon = "󰓩", group = "Tabs" },

			-- Group: Diagnostics
			{ "<leader>d", group = "Diagnostics" },
			{ "<leader>dw", icon = " 󰈔", group = "Workspace diagnostics" },
			{ "<leader>db", icon = " ", group = "buffer diagnostics" },
			{ "<leader>dl", icon = " ", group = "line diagnostics" },

			-- Group: Terminal & Trouble Diagnostics
			-- { "<leader>x", group = "Trouble Diagnostics" },

			-- Group: File Explorer
			{ "<leader>e", icon = "󰙅", group = "File Explorer" },
			-- { "<leader>ee", icon = "󰙅 ", group = "Toggle file explorer" },
			-- { "<leader>ef", icon = "󰙅 󰈔", group = "Toggle file explorer on current file" },
			-- { "<leader>ep", icon = "󰙅 ", group = "Reset file explorer to project root" },
			-- { "<leader>er", icon = "󰙅 󰑐", group = "Refresh file explorer" },
			-- { "<leader>ew", icon = "󰙅 󰘕", group = "Collapse file explorer" },

			-- Group: Fuzzy Finder
			{ "<leader>/", icon = "", group = "Grep" },
			{ "<leader><leader>", icon = "", group = "Smart Find Files" },
			{ "<leader>f", group = "Fuzzy Find" },
			{ "<leader>fb", icon = " ", group = "Find Buffers" },
			{ "<leader>fc", icon = " ", group = "Find Config Files" },
			{ "<leader>ff", icon = " ", group = "Find Files" },
			{ "<leader>fg", icon = " ", group = "Find Git Files" },
			{ "<leader>fr", icon = " 󰈔", group = "Find Recent Files" },
			{ "<leader>fs", icon = " ", group = "Visual selection or word" },
			{ "<leader>ft", icon = " ", group = "Find Todos" },

			-- Git
			{ "<leader>g", group = "Git" },
			-- TODO: Complete Git icons

			-- Git signs
			{ "<leader>h", group = "Git Hunks" },

			-- Group: Rename
			{ "<leader>r", icon = "󰑕", group = "Rename" },
			-- { "<leader>rn", icon = "󰑕 ", group = "Smart rename" },

			-- Group: Session Manager
			{ "<leader>q", icon = "", group = "Session Manager" },
			{ "<leader>qd", icon = " ", group = "Don't save current session" },
			{ "<leader>ql", icon = " 󰦛", group = "Restore last session" },
			{ "<leader>qs", icon = " 󰦛", group = "Restore session" },
			{ "<leader>qS", icon = " ", group = "Select session" },

			-- Group: Split Windows
			{ "<leader>s", icon = "󰯌", group = "Split Windows" },
			{ "<leader>se", icon = "󰯌 󱤗", group = "Make splits equal size" },
			{ "<leader>sh", icon = "󰯌 ", group = "Split window horizontally" },
			{ "<leader>sv", icon = "󰯌 ", group = "Split window vertically" },
			{ "<leader>sx", icon = "󰯌 ", group = "Close active split" },

			-- Todo Comments
			{ "<leader>[t", icon = " ", group = "Previous todo comment" },
			{ "<leader>]t", icon = " ", group = "Next todo comment" },

			-- Group: LSPs & Linting
			{ "<leader>l", icon = "", group = "LSPs & Linting" },
			{ "<leader>lr", icon = "", group = "Restart All LSPs" },
			{ "<leader>ll", group = "Trigger linting for current file" },
		})

		wk.setup(opts)
	end,
}
