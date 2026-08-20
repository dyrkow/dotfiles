-- hemisu/groups.lua
-- Defines highlight groups based on the original `colors/hemisu.vim`.

local M = {}

---@type fun(group: string, link_to: string)
local function link(group, link_to)
  vim.api.nvim_set_hl(0, group, { link = link_to, default = false })
end

local function set_hl(group, style)
  style = style or {}

  local opts = { default = false }

  if style.fg then
    opts.fg = style.fg.gui
    opts.ctermfg = style.fg.cterm
  end
  if style.bg then
    opts.bg = style.bg.gui
    opts.ctermbg = style.bg.cterm
  end
  if style.sp then
    opts.sp = style.sp.gui
  end

  local function apply_flags(flag_str)
    if not flag_str then
      return
    end
    for token in tostring(flag_str):gmatch("[^,%s]+") do
      if token == "bold" then
        opts.bold = true
      elseif token == "italic" then
        opts.italic = true
      elseif token == "underline" then
        opts.underline = true
      elseif token == "undercurl" then
        opts.undercurl = true
      elseif token == "strikethrough" then
        opts.strikethrough = true
      end
    end
  end

  apply_flags(style.gui)
  apply_flags(style.cterm)

  if style.ctermfg then
    opts.ctermfg = style.ctermfg
  end
  if style.ctermbg then
    opts.ctermbg = style.ctermbg
  end

  vim.api.nvim_set_hl(0, group, opts)
end

function M.apply(palette)
  -- CursorLine / menu-like groups (Vim >= 7 section in original scheme).
  set_hl("CursorLine", { bg = palette.faint })
  set_hl("MatchParen", { fg = palette.accent1, bg = palette.faint, gui = "bold" })
  set_hl("Pmenu", { bg = palette.faint })
  set_hl("PmenuThumb", { bg = palette.norm })
  set_hl("PmenuSBar", { bg = palette.subtle })
  set_hl("PmenuSel", { bg = palette.faintBlue })
  set_hl("ColorColumn", { bg = palette.faintRed })

  -- Spell*: Vim uses guisp + undercurl for gui, and background-based cterm fallback.
  -- Here we use GUI definition + ctermbg to keep close visual parity in terminals.
  set_hl("SpellBad", { sp = palette.normRed, gui = "undercurl", ctermbg = palette.faintRed.cterm })
  set_hl("SpellCap", { sp = palette.accent1, gui = "undercurl", ctermbg = palette.faintBlue.cterm })
  set_hl("SpellRare", { sp = palette.normGreen, gui = "undercurl", ctermbg = palette.faintGreen.cterm })
  set_hl("SpellLocal", { sp = palette.accent4, gui = "undercurl", ctermbg = palette.faint.cterm })

  link("CursorColumn", "CursorLine")

  -- UI section.
  set_hl("Normal", { fg = palette.norm, bg = palette.bg })
  set_hl("NonText", { fg = palette.subtle })
  set_hl("Cursor", { fg = palette.bg, bg = palette.accent3 })
  set_hl("Visual", { bg = palette.faintBlue })
  set_hl("IncSearch", { bg = palette.faintBlue })
  set_hl("Search", { bg = palette.faintGreen })
  set_hl("StatusLine", { fg = palette.norm, bg = palette.faint, gui = "bold", cterm = "bold" })
  set_hl("StatusLineNC", { fg = palette.dimmed, bg = palette.faint })
  set_hl("SignColumn", { fg = palette.norm })
  set_hl("VertSplit", { fg = palette.subtle, bg = palette.faint })
  set_hl("TabLine", { fg = palette.dimmed, bg = palette.faint })
  set_hl("TabLineSel", { gui = "bold", cterm = "bold" })
  set_hl("Folded", { fg = palette.comment, bg = palette.faint })
  set_hl("Directory", { fg = palette.accent1 })
  set_hl("Title", { fg = palette.accent4, gui = "bold", cterm = "bold" })
  set_hl("ErrorMsg", { bg = palette.faintRed })
  set_hl("DiffAdd", { bg = palette.faintGreen })
  set_hl("DiffChange", { bg = palette.faintRed })
  set_hl("DiffDelete", { fg = palette.normRed, bg = palette.faintRed })
  set_hl("DiffText", { bg = palette.faintRed, gui = "bold", cterm = "bold" })
  set_hl("User1", { fg = palette.bg, bg = palette.normGreen })
  set_hl("User2", { fg = palette.bg, bg = palette.normRed })
  set_hl("User3", { fg = palette.bg, bg = palette.normBlue })

  link("WildMenu", "IncSearch")
  link("FoldColumn", "SignColumn")
  link("WarningMsg", "ErrorMsg")
  link("MoreMsg", "Title")
  link("Question", "MoreMsg")
  link("ModeMsg", "MoreMsg")
  link("TabLineFill", "StatusLineNC")
  link("LineNr", "NonText")
  link("SpecialKey", "NonText")

  -- Generic syntax.
  set_hl("Delimiter", { fg = palette.dimmed })
  set_hl("Comment", { fg = palette.comment, gui = "italic" })
  set_hl("Underlined", { fg = palette.accent1, gui = "underline", cterm = "underline" })
  set_hl("Type", { fg = palette.accent3 })
  set_hl("String", { fg = palette.accent2 })
  set_hl("Keyword", { fg = palette.accent2, gui = "bold", cterm = "bold" })
  set_hl("Todo", { fg = palette.normRed, gui = "bold", cterm = "bold" })
  set_hl("Function", { gui = "bold", cterm = "bold" })

  link("Identifier", "Function")
  link("Statement", "Type")
  link("Constant", "Directory")
  link("Number", "Constant")
  link("Special", "Constant")
  link("PreProc", "Constant")
  link("Error", "ErrorMsg")

  -- HTML / CSS / Markdown / Shell / JS / Help groups.
  link("htmlLink", "Underlined")
  link("htmlTag", "Type")
  link("htmlEndTag", "htmlTag")

  link("cssBraces", "Delimiter")
  link("cssSelectorOp", "cssBraces")
  link("cssClassName", "Normal")

  -- Markdown syntax groups are provided by markdown.vim; we only link.
  link("mkdListItem", "mkdDelimiter")

  link("shOperator", "Delimiter")
  link("shCaseBar", "Delimiter")

  link("javaScriptValue", "Constant")
  link("javaScriptNull", "Constant")
  link("javaScriptBraces", "Normal")

  link("helpExample", "String")
  link("helpHeadline", "Title")
  link("helpSectionDelim", "Comment")
  link("helpHyperTextEntry", "Statement")
  link("helpHyperTextJump", "Underlined")
  link("helpURL", "Underlined")

  -- Neovim modern UI groups (floats, separators, etc.).
  set_hl("NormalFloat", { fg = palette.norm, bg = palette.faint })
  set_hl("FloatBorder", { fg = palette.subtle, bg = palette.faint })
  set_hl("WinSeparator", { fg = palette.subtle, bg = palette.faint })

  -- Cursor + line numbers.
  set_hl("CursorLineNr", { fg = palette.norm, bg = palette.faint })

  -- Diagnostics (used by built-in lsp/diagnostic display).
  -- Keep it close to spell colors: Error=red, Warn=tan, Info=blue, Hint=green.
  set_hl("DiagnosticError", { sp = palette.normRed, undercurl = true, ctermbg = palette.faintRed.cterm })
  set_hl("DiagnosticWarn", { sp = palette.accent4, undercurl = true, ctermbg = palette.faintGreen.cterm })
  set_hl("DiagnosticInfo", { sp = palette.accent1, undercurl = true, ctermbg = palette.faintBlue.cterm })
  set_hl("DiagnosticHint", { sp = palette.normGreen, undercurl = true, ctermbg = palette.faintGreen.cterm })

  -- Underline variants (some UI uses these groups specifically).
  set_hl("DiagnosticUnderlineError", { sp = palette.normRed, underline = true, undercurl = true })
  set_hl("DiagnosticUnderlineWarn", { sp = palette.accent4, underline = true, undercurl = true })
  set_hl("DiagnosticUnderlineInfo", { sp = palette.accent1, underline = true, undercurl = true })
  set_hl("DiagnosticUnderlineHint", { sp = palette.normGreen, underline = true, undercurl = true })

  -- LSP reference groups (used by :lua vim.lsp.buf.document_highlight()).
  set_hl("LspReferenceText", { bg = palette.faintBlue })
  set_hl("LspReferenceRead", { bg = palette.faintBlue })
  set_hl("LspReferenceWrite", { bg = palette.faintGreen })

  -- Treesitter capture groups (common defaults).
  link("@comment", "Comment")
  link("@comment.documentation", "Comment")
  link("@string", "String")
  link("@keyword", "Keyword")
  link("@keyword.function", "Keyword")
  link("@keyword.conditional", "Keyword")
  link("@type", "Type")
  link("@function", "Function")
  link("@function.call", "Function")
  link("@variable", "Identifier")
  link("@variable.builtin", "Identifier")
  link("@number", "Number")
  link("@boolean", "Constant")
  link("@punctuation.delimiter", "Delimiter")
  link("@punctuation.bracket", "Delimiter")
  link("@operator", "Delimiter")

  -- LSP semantic tokens (base groups, without filetype suffix).
  link("@lsp.type.class", "Type")
  link("@lsp.type.comment", "Comment")
  link("@lsp.type.decorator", "Identifier")
  link("@lsp.type.enum", "Type")
  link("@lsp.type.enumMember", "Identifier")
  link("@lsp.type.event", "Identifier")
  link("@lsp.type.field", "Identifier")
  link("@lsp.type.function", "Function")
  link("@lsp.type.interface", "Type")
  link("@lsp.type.keyword", "Keyword")
  link("@lsp.type.macro", "Constant")
  link("@lsp.type.method", "Function")
  link("@lsp.type.modifier", "Keyword")
  link("@lsp.type.namespace", "Type")
  link("@lsp.type.number", "Number")
  link("@lsp.type.operator", "Delimiter")
  link("@lsp.type.parameter", "Identifier")
  link("@lsp.type.property", "Identifier")
  link("@lsp.type.string", "String")
  link("@lsp.type.type", "Type")
  link("@lsp.type.typeParameter", "Type")
  link("@lsp.type.variable", "Identifier")

  set_hl("@lsp.mod.deprecated", { fg = palette.comment, gui = "strikethrough" })

  -- neo-tree.nvim
  set_hl("NeoTreeNormal", { fg = palette.norm, bg = palette.bg })
  link("NeoTreeNormalNC", "NeoTreeNormal")
  set_hl("NeoTreeEndOfBuffer", { fg = palette.subtle, bg = palette.bg })

  set_hl("NeoTreeDimText", { fg = palette.subtle })
  link("NeoTreeIndentMarker", "NeoTreeDimText")
  link("NeoTreeExpander", "NeoTreeDimText")

  -- Names/icons.
  set_hl("NeoTreeDirectoryName", { fg = palette.accent1 })
  link("NeoTreeDirectoryIcon", "NeoTreeDirectoryName")
  set_hl("NeoTreeFileName", { fg = palette.norm })
  set_hl("NeoTreeFileNameOpened", { fg = palette.accent1, gui = "bold", cterm = "bold" })
  set_hl("NeoTreeFileIcon", { fg = palette.accent1 })

  -- Git status groups.
  set_hl("NeoTreeModified", { fg = palette.normRed, gui = "bold", cterm = "bold" })
  set_hl("NeoTreeGitModified", { fg = palette.normRed, gui = "bold", cterm = "bold" })
  set_hl("NeoTreeGitAdded", { fg = palette.normGreen, gui = "bold", cterm = "bold" })
  set_hl("NeoTreeGitDeleted", { fg = palette.normRed, gui = "bold", cterm = "bold" })
  set_hl("NeoTreeGitConflict", { fg = palette.accent4, gui = "bold", cterm = "bold" })
  set_hl("NeoTreeGitRenamed", { fg = palette.accent1, gui = "bold", cterm = "bold" })
  set_hl("NeoTreeGitUntracked", { fg = palette.normGreen })
  set_hl("NeoTreeGitIgnored", { fg = palette.comment, gui = "italic", cterm = "italic" })

  -- telescope.nvim
  set_hl("TelescopeNormal", { fg = palette.norm, bg = palette.faint })
  link("TelescopePreviewNormal", "TelescopeNormal")
  link("TelescopePromptNormal", "TelescopeNormal")
  link("TelescopeResultsNormal", "TelescopeNormal")

  set_hl("TelescopeBorder", { fg = palette.subtle, bg = palette.faint })
  link("TelescopePromptBorder", "TelescopeBorder")
  link("TelescopeResultsBorder", "TelescopeBorder")
  link("TelescopePreviewBorder", "TelescopeBorder")

  link("TelescopeTitle", "TelescopeBorder")
  link("TelescopePromptTitle", "TelescopeTitle")
  link("TelescopeResultsTitle", "TelescopeTitle")
  link("TelescopePreviewTitle", "TelescopeTitle")

  link("TelescopeSelection", "Visual")
  link("TelescopeSelectionCaret", "TelescopeSelection")
  link("TelescopeMultiSelection", "Type")

  link("TelescopeMatching", "Underlined")
  link("TelescopePromptPrefix", "Identifier")
  link("TelescopePromptCounter", "NonText")

  -- indent-blankline.nvim (ibl)
  set_hl("IblIndent", { fg = palette.subtle })
  set_hl("IblScope", { fg = palette.accent1, underline = true })
  set_hl("IblWhitespace", { fg = palette.subtle })
end

return M

