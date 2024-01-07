return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the four listed parsers should always be installed)
        ensure_installed = {"python", "markdown", "sql", "c", "lua", "vimdoc"},
     
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
     
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
     
        highlight = {
          -- `false` will disable the whole extension
          enable = true,
     
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
      },
  } end 
}

