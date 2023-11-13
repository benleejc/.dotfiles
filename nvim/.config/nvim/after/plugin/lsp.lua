-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'pyright',
    'eslint',
    'sumneko_lua',
    'pylsp',
    'marksman',
    'ansiblels',
    'terraformls',
    'tflint'
})

lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals= { 'vim' }
            }
        }
    }
})

lsp.configure('pyright', {
    python = {
        analysis = {
            useLibraryCodeForTypes = true,
            diagnosticSeverityOverrides = {
                reportGeneralTypeIssues = "none",
                reportOptionalMemberAccess = "none",
                reportOptionalSubscript = "none",
                reportPrivateImportUsage = "none",
            },
            autoImportCompletions = false,
        },
        linting = {pylintEnabled = false}
    }
})

lsp.configure('pylsp', {
    pylsp = {
        builtin = {
            installExtraArgs = {'flake8', 'pycodestyle', 'pydocstyle', 'pyflakes', 'pylint', 'yapf'},
        },
        plugins = {
            jedi_completion = { enabled = false },
            rope_completion = { enabled = false },
            flake8 = { enabled = false },
            pyflakes = { enabled = false },
            pycodestyle = {
                ignore = {'E226', 'E266', 'E302', 'E303', 'E304', 'E305', 'E402', 'C0103', 'W0104', 'W0621', 'W391', 'W503', 'W504'},
                maxLineLength = 99,
            },
        },
    },
})

local cmp = require('cmp')


lsp.setup_nvim_cmp({
    mapping = cmp.mapping.preset.insert({
        ['<TAB>'] = cmp.mapping.confirm({ select=true }),
    })
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I',
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer=bufnr, remap = false}
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
