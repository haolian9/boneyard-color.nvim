--design: less color, more concentrated
--
--severities:
--* trace: comment, string literal, punctuation
--* debug: if, try...catch, for, const/var, switch/match
--* info: identifier/func/variable
--* warning: async/await, defer
--* error: return, try
--
--
--           HERE LIES
--          SQUIDWARD'S
--             HOPES
--              AND
--            DREAMS
--
--

local ex = require("infra.ex")

local api = vim.api

---for 'cterm=none', `{bold = nil, underline = nil}` does the same
---@param group string
---@param cterm_spec {fg: integer|string, bg: integer|string, bold?: boolean, underline?: boolean}
local function hi(group, cterm_spec)
  local spec = {
    ctermfg = cterm_spec.fg,
    ctermbg = cterm_spec.bg,
    cterm = {
      bold = cterm_spec.bold,
      underline = cterm_spec.underline,
    },
  }
  api.nvim_set_hl(0, group, spec)
end

do --main
  do -- prelude
    assert(vim.go.background == "dark")
    ex("highlight", "clear")
    vim.g.colors_name = "boothill"
  end

  do --vim relevant
    hi("Folded", { fg = 243 })
    hi("FoldColumn", { fg = 243, bold = true })
    hi("SignColumn", {})
    hi("Visual", { fg = 7, bg = 2 })
    hi("VisualNOS", { bg = 2 })
    hi("StatusLine", { fg = 166, bold = true, underline = true })
    hi("StatusLineNC", { bold = true, underline = true })
    hi("WinsEparator", { fg = 7 })

    hi("IncSearch", { bg = 178, bold = true })
    hi("Search", { bg = 3 })

    hi("WildMenu", { bg = 222 })

    hi("PMenu", { fg = 7, bg = 8 })
    hi("PMenuSel", { fg = 7, bg = 30, bold = true })
    hi("PMenuSbar", { fg = 8, bg = 7 })
    hi("PMenuThumb", { fg = 7, bg = 8 })

    hi("CursorColumn", {})
    hi("CursorLine", { bold = true })

    hi("TabLine", { fg = 248 })
    hi("TabLineSel", { fg = 130, bold = true })
    hi("TabLineFill", {})

    hi("LineNr", { fg = 10 })
    hi("CursorLineNr", { bold = true })

    --misc
    hi("Whitespace", { fg = 15 })
    hi("MatchParen", { fg = 15, bg = 14 })
    hi("MsgSeparator", { fg = 9, bg = 15, underline = true })
  end

  do --diff
    hi("diffAdded", { fg = 7 })
    hi("diffRemoved", { fg = 243 })
    hi("diffChanged", { fg = 5 })
    hi("diffFile", { fg = 0, bold = true })
    hi("gitDiff", { fg = 0 })
  end

  do --statusline
    hi("StatusLineBufStatus", { fg = 7, bold = true })
    hi("StatusLineFilePath", { fg = 130 })
    hi("StatusLineAltFile", { fg = 248 })
    hi("StatusLineCursor", { fg = 7 })
    hi("StatusLineSpan", { fg = 15 })
    hi("StatusLineRepeat", { fg = 7 })
  end

  do --general grammar token
    --:h group-name

    --rest: Underlined, Ignore,   Error
    hi("Normal", { fg = 15 })
    hi("Comment", { fg = 244 })
    hi("Todo", { fg = 9, bg = 15, bold = true })

    --any constant
    --rest: Character Number Boolean Float
    hi("Constant", { fg = 7 })
    hi("String", { fg = 248 })

    --any variable name
    hi("Identifier", { fg = 7 })
    hi("Function", { fg = 7 })

    --any statement
    --rest: Operator Keyword Conditional Repeat Label Exception
    hi("Statement", { fg = 248 })

    --generic Preprocessor
    --rest: Include Define Macro PreCondit
    hi("PreProc", { fg = 7 })

    --int,              long,     char,    etc; struct, union, enum, etc.
    --rest: Structure Typedef StorageClass
    hi("Type", { fg = 7 })

    --any special symbol
    --rest: SpecialChar Tag SpecialComment Debug
    hi("Special", { fg = 7 })
    hi("Delimiter", { fg = 248 })
  end

  do --lsp
    hi("@error", { fg = 7, underline = true })

    hi("@function", { fg = 7 })
    hi("@variable", { fg = 7 })
    hi("@function.builtin", { fg = 7 })
    hi("@type.builtin", { fg = 7 })
    hi("@variable.builtin", { fg = 7 })
    hi("@constant.builtin", { fg = 7 })

    hi("@keyword", { fg = 31 })
    hi("@keyword.function", { fg = 31 })
    hi("@function.macro", { fg = 31 })

    hi("@keyword.return", { fg = 166 })

    hi("@keyword.operator", { fg = 248 })
    hi("@exception", { fg = 248 })
    hi("@type.qualifier", { fg = 248 })
    hi("@string.escape", { fg = 248 })
    hi("@string.special", { fg = 248 })
    hi("@punctuation.delimiter", { fg = 248 })
    hi("@punctuation.special", { fg = 248 })
    hi("@punctuation.bracket", { fg = 248 })
    hi("@punctuation.bracket", { fg = 248 })
  end

  do --diagnostic
    hi("DiagnosticHint", { fg = 10 })
  end
end
