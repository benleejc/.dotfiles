require("obsidian").setup({
    dir = "~/obsidian/myvault",
    notes_subdir = "notes/inbox",
    daily_notes = {
        folder = "notes/dailies",
    },
    completion = {
        nvim_cmp=true,
    }
})

vim.keymap.set(
  "n",
  "<leader>of",
  function()
    if require('obsidian').util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "<leader>of"
    end
  end,
  { noremap = false, expr = true}
)

vim.keymap.set("n", "<leader>oo", "<Cmd>ObsidianNew<CR>")
