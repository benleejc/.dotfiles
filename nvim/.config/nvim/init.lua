require("ben")

-- workaround for vimwiki to respect path
--vim.g['vimwiki_list'] = {path = '/Users/benjaminlee/Documents/test_pages/', syntax='markdown', ext = '.md'}
vim.cmd("let g:vimwiki_list = [{'path': '~/personal/Notes/', 'syntax':'markdown', 'ext':'.md'}]")
-- let markdown lnks = wikilinks instead of native markdown links
-- vim.cmd("let g:vimwiki_syntaxlocal_vars['markdown']['Link1'] = g:vimwiki_syntaxlocal_vars['default']['Link1']")
