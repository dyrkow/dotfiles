local keymap = {};

function keymap.map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function keymap.nmap(shortcut, command)
  keymap.map('n', shortcut, command)
end

function keymap.imap(shortcut, command)
  keymap.map('i', shortcut, command)
end

return keymap;
