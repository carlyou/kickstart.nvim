vim.keymap.set('n', '<leader>e', function()
  vim.cmd(':lua vim.print(' .. vim.fn.getreg '+' .. ')')
end, { noremap = true, silent = true, desc = '[Execute] and print yanked command' })

-- prevent backspace from exiting commenting
vim.keymap.set('c', '<BS>', function()
  if vim.fn.getcmdline() == '' then
    return ''
  else
    return '<BS>'
  end
end, { expr = true, noremap = true })

vim.keymap.set('v', 'Y', '"+y')
vim.keymap.set('n', '<Space>', '<cmd>nohlsearch<CR>')
vim.keymap.set({ 'n', 'v' }, '0', '^')

vim.keymap.set('n', '-', '<C-w><', { noremap = true, silent = true, desc = 'Narrower window' })
vim.keymap.set('n', '+', '<C-w>>', { noremap = true, silent = true, desc = 'Wider window' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Common shortcuts with command modifier
-- 1. copy/paste with command+c/v
vim.g.neovide_input_use_logo = 1
vim.keymap.set('n', '<D-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('v', '<D-c>', '"+y', { noremap = true, silent = true })

-- this prevents vim's auto commenting when pasting
vim.keymap.set('i', '<D-v>', function()
  vim.opt.paste = true
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-R>+', true, false, true), 'n', true)
  vim.defer_fn(function()
    vim.opt.paste = false
  end, 10)
end, { noremap = true, silent = true })

-- force redraw after pasting in command mode to display pasted text
vim.keymap.set('c', '<D-v>', function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-R>+', true, false, true), 'n', true)
  vim.cmd 'redraw' -- force UI update
end, { noremap = true, silent = true })

-- 2. tab create/close/select
vim.keymap.set('n', '<D-t>', '<cmd>tabnew<CR>', { noremap = true, silent = true })
-- Close tab with command+w, but if only one tab is open, close window within the tab instead
vim.keymap.set('n', '<D-w>', function()
  local tab_count = vim.fn.tabpagenr '$'
  if tab_count > 1 then
    vim.cmd 'tabclose'
  else
    vim.cmd 'q'
  end
end, { noremap = true, silent = true })

vim.keymap.set('n', '<D-1>', '1gt', { noremap = true, silent = true })
vim.keymap.set('n', '<D-2>', '2gt', { noremap = true, silent = true })
vim.keymap.set('n', '<D-3>', '3gt', { noremap = true, silent = true })
vim.keymap.set('n', '<D-4>', '4gt', { noremap = true, silent = true })
vim.keymap.set('n', '<D-5>', '5gt', { noremap = true, silent = true })
vim.keymap.set('n', '<D-6>', '6gt', { noremap = true, silent = true })
vim.keymap.set('n', '<D-7>', '7gt', { noremap = true, silent = true })
vim.keymap.set('n', '<D-8>', '8gt', { noremap = true, silent = true })
vim.keymap.set('n', '<D-9>', '9gt', { noremap = true, silent = true })
vim.keymap.set('n', '<D-0>', '<cmd>tablast<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<D-[>', '<cmd>tabprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<D-]>', '<cmd>tabnext<CR>', { noremap = true, silent = true })

-- 3. ctrl-n/p/f/b in edit
--vim.keymap.set('i', '<C-f>', '<Right>', { noremap = true, silent = true })
--vim.keymap.set('i', '<C-b>', '<Left>', { noremap = true, silent = true })
--vim.keymap.set('i', '<C-n>', '<Down>', { noremap = true, silent = true })
--vim.keymap.set('i', '<C-p>', '<Up>', { noremap = true, silent = true })

-- Terminal
vim.keymap.set('n', '<leader><leader>t', '<cmd>vs<CR><cmd>terminal<CR>', { noremap = true, silent = true, desc = 'Open [t]erminal in split on right' })

-- Diagnostic
vim.keymap.set('n', '<leader><leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n><C-w><C-w>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-z>', '<C-\\><C-n><C-w><C-w>', { noremap = true, silent = true })
--vim.keymap.set('t', '<D-v>', '<C-r>+', { noremap = true, silent = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', 'HH', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', 'LL', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
