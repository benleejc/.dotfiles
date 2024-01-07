return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        require('telescope').setup({})
        --require('telescope').setup({
        --  defaults = {
        --    -- ...
        --  },
        --  pickers = {
        --    find_files = {
        --      theme = "dropdown",
        --      find_command = {"fd", "-L", "-H"}
        --    }
        --  },
        --})
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function ()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>pk', builtin.keymaps, {})
    end
}
