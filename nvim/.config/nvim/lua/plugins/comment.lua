return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
        require('Comment').setup({
            padding = true,
            ignore = '^$',
            mappings = {
                basic = true,
                extra = true,
                extended = true,
            },
        })
    end,
}
