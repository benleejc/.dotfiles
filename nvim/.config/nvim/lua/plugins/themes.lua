return {
    "catppuccin/nvim",
    name = "catppucin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "macchiato"
        }) end
}
