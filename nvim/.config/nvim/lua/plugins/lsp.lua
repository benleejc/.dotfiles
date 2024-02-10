return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<S-Tab>'] = cmp.mapping.confirm({ select=true }),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }),
        sources = cmp.config.sources({
            { name = 'copilot', group_index = 2 },
        })
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {
            'ruff_lsp',
            'pyright',
            'rust_analyzer',
            'lua_ls',
            'marksman',
            'ansiblels',
            'tsserver',
            'html',
            'cssls',
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  }
}

-- -- Learn the keybindings, see :help lsp-zero-keybindings
-- -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
-- local lsp = require('lsp-zero')
-- lsp.preset('recommended')
-- 
-- lsp.ensure_installed({
--     'pyright',
--     'eslint',
--     'lua_ls',
--     'pylsp',
--     'marksman',
--     'ansiblels',
--     'terraformls',
--     'tflint'
-- })
-- 
-- lsp.configure('sumneko_lua', {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals= { 'vim' }
--             }
--         }
--     }
-- })
-- 
-- lsp.configure('pyright', {
--     python = {
--         analysis = {
--             useLibraryCodeForTypes = true,
--             diagnosticSeverityOverrides = {
--                 reportGeneralTypeIssues = "none",
--                 reportOptionalMemberAccess = "none",
--                 reportOptionalSubscript = "none",
--                 reportPrivateImportUsage = "none",
--             },
--             autoImportCompletions = false,
--         },
--         linting = {pylintEnabled = false}
--     }
-- })
-- 
-- lsp.configure('pylsp', {
--     pylsp = {
--         builtin = {
--             installExtraArgs = {'flake8', 'pycodestyle', 'pydocstyle', 'pyflakes', 'pylint', 'yapf'},
--         },
--         plugins = {
--             jedi_completion = { enabled = false },
--             rope_completion = { enabled = false },
--             flake8 = { enabled = false },
--             pyflakes = { enabled = false },
--             pycodestyle = {
--                 ignore = {'E226', 'E266', 'E302', 'E303', 'E304', 'E305', 'E402', 'C0103', 'W0104', 'W0621', 'W391', 'W503', 'W504'},
--                 maxLineLength = 99,
--             },
--         },
--     },
-- })
-- 
-- local cmp = require('cmp')
-- 
-- 
-- lsp.setup_nvim_cmp({
--     mapping = cmp.mapping.preset.insert({
--         ['<TAB>'] = cmp.mapping.confirm({ select=true }),
--     })
-- })
-- 
-- lsp.set_preferences({
--     suggest_lsp_servers = true,
--     sign_icons = {
--         error = 'E',
--         warn = 'W',
--         hint = 'H',
--         info = 'I',
--     }
-- })
-- 
-- lsp.on_attach(function(client, bufnr)
--     local opts = {buffer=bufnr, remap = false}
--     vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--     vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--     vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--     vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--     vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--     vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--     vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--     vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--     vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--     vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
-- end)
-- 
-- lsp.setup()
-- 
-- vim.diagnostic.config({
--     virtual_text = true,
