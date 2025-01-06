return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- Todo Comments start with the comment keyword, keyword, then a colon ":"
    -- Acceptable commands for Todo Comments:
    --   --PERF: fully optimised
    --   --HACK: hmm, this looks a bit funky
    --   --TODO: What else?
    --   --FIX: this needs fixing
    --   --WARNING: ???

    -- set keymaps
    vim.keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,
}
