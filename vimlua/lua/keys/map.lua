--[[ Утилиты для определения комбинаций клавиш ]]--

-- <C>: Represents the control key
-- <A>: Represents the alt key.

-- Map a key to a command
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- Mapping in normal mode
function nm(shortcut, command)
  map('n', shortcut, command)
end

-- Mapping in insert mode
function im(shortcut, command)
  map('i', shortcut, command)
end

-- Mapping in visual mode
function vm(shortcut, command)
  map('v', shortcut, command)
end

-- Mapping in terminal mode
function tm(shortcut, command)
  map('t', shortcut, command)
end
