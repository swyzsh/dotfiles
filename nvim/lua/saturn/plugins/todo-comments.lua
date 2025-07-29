return {
	"folke/todo-comments.nvim",
	event = "BufReadPost",
	dependencies = { "nvim-lua/plenary.nvim" },
	-- Todo Comments start with the comment keyword, keyword, then a colon ":"
	-- Acceptable commands for Todo Comments:
	--   --PERF: fully optimised
	--   --HACK: hmm, this looks a bit funky
	--   --TODO: What else?
	--   --FIX: this needs fixing
	--   --WARNING: ???
	opts = {},
}
