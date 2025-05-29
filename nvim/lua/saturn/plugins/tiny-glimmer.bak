return {
  "rachartier/tiny-glimmer.nvim",
  event = "VeryLazy",
  priority = 1000, -- Needs to be a really low priority, to catch others plugins keybindings.
  opts = {
    overwrite = {
      yank = {
        enabled = true,
        default_animation = "reverse_fade",
      },
      search = {
        enabled = true,
        default_animation = "pulse",
        next_mapping = "n", -- Keys to navigate to the next match
        prev_mapping = "N", -- Keys to navigate to the previous match
      },
      paste = {
        enabled = true,
        default_animation = "reverse_fade",
        paste_mapping = "p", -- Keys to paste
        Paste_mapping = "P", -- Keys to paste above the cursor
      },
      undo = {
        enabled = true,
        default_animation = {
          name = "fade",
          settings = {
            from_color = "DiffDelete",
            max_duration = 500,
            min_duration = 500,
          },
        },
        undo_mapping = "u",
      },
      redo = {
        enabled = false,
        default_animation = {
          name = "reverse_fade",
          settings = {
            from_color = "DiffAdd",
            max_duration = 500,
            min_duration = 500,
          },
        },
        redo_mapping = "<c-r>",
      },
    },
    -- Only use if you have a transparent background
    -- It will override the highlight group background color for `to_color` in all animations
    transparency_color = "#0f1c1e",
  },
}
