local c = require("moksha.colors")
local cfg = vim.g.moksha_config
local util = require("moksha.util")

local M = {}
local hl = { langs = {}, plugins = {} }

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(
            string.format(
                "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
                group_name,
                group_settings.fg or "none",
                group_settings.bg or "none",
                group_settings.sp or "none",
                group_settings.fmt or "none"
            )
        )
    end
end

hl.common = {
    Normal = { fg = c.fg, bg = c.bg_base },
    Terminal = { fg = c.fg, bg = c.bg_dark },
    EndOfBuffer = { fg = c.grey, bg = c.bg_dark },
    SignColumn = { fg = c.fg, bg = c.bg_dark },
    LineNr = { fg = c.grey, bg = c.bg_dark },
    CursorLineNr = { fg = c.yellow, bg = c.bg_dark, fmt = "bold" },
    Folded = { fg = c.cream, bg = c.bg_medium },
    FoldColumn = { fg = c.cream, bg = c.bg_medium },
    ColorColumn = { bg = c.bg_red },
    Conceal = { fg = c.grey },
    Cursor = { fmt = "reverse" },
    vCursor = { fmt = "reverse" },
    iCursor = { fmt = "reverse" },
    lCursor = { fmt = "reverse" },
    CursorIM = { fmt = "reverse" },
    CursorColumn = { bg = c.bg_dark },
    CursorLine = { bg = c.bg_dark },
    ToolbarLine = { bg = c.grey },
    Added = { fg = c.green },
    Removed = { fg = c.red },
    Changed = { fg = c.blue },
    DiffAdd = { fg = c.none, bg = c.bg_green },
    DiffChange = { fg = c.none, bg = c.bg_blue },
    DiffDelete = { fg = c.grey, bg = c.bg_dark },
    DiffText = { fg = c.none, bg = c.bg_red },
    DiffAdded = { fg = c.green },
    DiffChanged = { fg = c.blue },
    DiffDeleted = { fg = c.pink },
    DiffRemoved = { fg = c.red },
    DiffFile = { fg = c.cyan },
    DiffIndexLine = { fg = c.grey },
    Directory = { fg = c.blue, fmt = "bold" },
    ErrorMsg = { fg = c.red, bg = c.bg_medium },
    WarningMsg = { fg = c.yellow, bg = c.bg_medium },
    MoreMsg = { fg = c.cyan, fmt = "bold" },
    ModeMsg = { fg = c.pink, fmt = "bold" },
    MsgArea = { fg = c.none, bg = c.bg_dark },
    CurSearch = { fg = c.bg_dark, bg = c.orange },
    IncSearch = { fg = c.bg_dark, bg = c.orange },
    Search = { fg = c.bg_dark, bg = c.search },
    Substitute = { fg = c.bg_dark, bg = c.green },
    MatchParen = { fg = c.red, bg = c.black, fmt = "bold" },
    NonText = { fg = c.grey },
    Whitespace = { fg = c.dark_grey },
    SpecialKey = { fg = c.blue },
    Pmenu = { fg = c.fg, bg = c.bg_medium },
    PmenuSbar = { fg = c.none, bg = c.none },
    PmenuSel = { fg = c.fg, bg = c.select },
    WildMenu = { fg = c.bg_base, bg = c.fg },
    PmenuThumb = { fg = c.none, bg = c.grey },
    Question = { fg = c.yellow },
    SpellBad = { fg = c.none, fmt = "undercurl", sp = c.red },
    SpellCap = { fg = c.none, fmt = "undercurl", sp = c.light_grey },
    SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.blue },
    SpellRare = { fg = c.none, fmt = "undercurl", sp = c.pink },
    StatusLine = { fg = c.cream, bg = c.bg_light },
    StatusLineTerm = { fg = c.cream, bg = c.bg_light },
    StatusLineNC = { fg = c.grey, bg = c.bg_light },
    StatusLineTermNC = { fg = c.light_grey, bg = c.bg_light },
    TabLine = { fg = c.light_grey, bg = c.bg_dark },
    TabLineFill = { fg = c.light_grey, bg = c.bg_light },
    TabLineSel = { fg = c.cream, bg = c.bg_base },
    WinSeparator = { fg = c.light_grey, bg = c.bg_light },
    VertSplit = { fg = c.light_grey, bg = c.bg_light },
    Visual = { fg = c.bg_dark, bg = c.search },
    VisualNOS = { fg = c.none, bg = c.search, fmt = "underline" },
    QuickFixLine = { fg = c.blue, bg = c.bg_dark },
    ToolbarButton = { fg = c.fg, bg = c.bg_base, fmt = "bold" },
    FloatBorder = { fg = c.light_grey, bg = c.none },
    FloatTitle = { fg = c.light_grey, bg = c.none },
    NormalFloat = { fg = c.fg, bg = c.bg_medium },
    Debug = { fg = c.brown },
    debugPC = { fg = c.bg_dark, bg = c.green },
    debugBreakpoint = { fg = c.bg_dark, bg = c.red },
}

hl.syntax = {
    Comment = { fg = c.light_grey, fmt = cfg.code_style.comments },
    Constant = { fg = c.blue },
    String = { fg = c.moss, fmt = cfg.code_style.strings },
    Character = { fg = c.purple, fmt = cfg.code_style.chars },
    Number = { fg = c.pink },
    Boolean = { fg = c.blue, fmt = cfg.code_style.bool },
    Float = { fg = c.pink },
    Identifier = { fg = c.fg, fmt = cfg.code_style.variables },
    Function = { fg = c.green, fmt = cfg.code_style.functions },
    Statement = { fg = c.orange },
    Conditional = { fg = c.orange, fmt = cfg.code_style.keywords },
    Repeat = { fg = c.orange, fmt = cfg.code_style.keywords },
    Label = { fg = c.red },
    Operator = { fg = c.yellow },
    Keyword = { fg = c.orange, fmt = cfg.code_style.keywords },
    Exception = { fg = c.red, fmt = cfg.code_style.exception },
    PreProc = { fg = c.yellow },
    Include = { fg = c.yellow },
    Define = { fg = c.yellow },
    Macro = { fg = c.green, fmt = cfg.code_style.macros },
    PreCondit = { fg = c.yellow },
    Type = { fg = c.cyan, fmt = cfg.code_style.types },
    StorageClass = { fg = c.cyan, fmt = cfg.code_style.types },
    Structure = { fg = c.cyan },
    Typedef = { fg = c.cyan, fmt = cfg.code_style.types },
    Special = { fg = c.purple },
    SpecialChar = { fg = c.purple, fmt = cfg.code_style.chars },
    Tag = { fg = c.brown, fmt = cfg.code_style.tags },
    Delimiter = { fg = c.faded },
    SpecialComment = { fg = c.light_grey, fmt = cfg.code_style.comments },
    Error = { fg = c.red },
    Todo = { fg = c.pink, bg = c.bg_light, fmt = cfg.code_style.comments },
    Title = { fg = c.orange, fmt = cfg.code_style.tags },
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
    hl.treesitter = {
        -- nvim-treesitter@0.9.2 and after
        ["@annotation"] = hl.common.Normal,
        ["@attribute"] = hl.syntax.Constant,
        ["@attribute.typescript"] = hl.syntax.Function,
        ["@boolean"] = hl.syntax.Boolean,
        ["@character"] = hl.syntax.Character,
        ["@comment"] = hl.syntax.Comment,
        ["@comment.todo"] = hl.syntax.Todo,
        ["@comment.todo.unchecked"] = hl.syntax.Todo,
        ["@comment.todo.checked"] = hl.syntax.Todo,
        ["@constant"] = hl.syntax.Constant,
        ["@constant.builtin"] = hl.syntax.Constant,
        ["@constant.macro"] = hl.syntax.Constant,
        ["@constructor"] = { fg = c.fg },
        ["@diff.add"] = hl.common.DiffAdded,
        ["@diff.delete"] = hl.common.DiffDeleted,
        ["@diff.plus"] = hl.common.DiffAdded,
        ["@diff.minus"] = hl.common.DiffDeleted,
        ["@diff.delta"] = hl.common.DiffChanged,
        ["@error"] = hl.syntax.Error,
        ["@function"] = hl.syntax.Function,
        ["@function.builtin"] = hl.syntax.Function,
        ["@function.macro"] = hl.syntax.Macro,
        ["@function.method"] = hl.syntax.Function,
        ["@keyword"] = hl.syntax.Keyword,
        ["@keyword.conditional"] = hl.syntax.Conditional,
        ["@keyword.directive"] = hl.syntax.Keyword,
        ["@keyword.exception"] = hl.syntax.Exception,
        ["@keyword.function"] = hl.syntax.Keyword,
        ["@keyword.import"] = hl.syntax.Include,
        ["@keyword.operator"] = hl.syntax.Include,
        ["@keyword.repeat"] = hl.syntax.Keyword,
        ["@label"] = hl.syntax.Label,
        ["@module"] = hl.syntax.Structure,
        ["@none"] = hl.common.Normal,
        ["@number"] = hl.syntax.Number,
        ["@number.float"] = hl.syntax.Float,
        ["@operator"] = hl.syntax.Operator,
        ["@parameter.reference"] = hl.syntax.Identifier,
        ["@property"] = hl.syntax.Identifier,
        ["@punctuation.delimiter"] = hl.syntax.Delimiter,
        ["@punctuation.bracket"] = { fg = c.fg },
        ["@string"] = hl.syntax.String,
        ["@string.regexp"] = hl.syntax.String,
        ["@string.escape"] = hl.syntax.String,
        ["@string.special.symbol"] = hl.syntax.SpecialChar,
        ["@tag"] = hl.syntax.Tag,
        ["@tag.attribute"] = hl.syntax.Tag,
        ["@tag.delimiter"] = hl.syntax.Delimiter,
        ["@text"] = { fg = c.fg },
        ["@note"] = { fg = c.fg },
        ["@warning"] = hl.common.WarningMsg,
        ["@danger"] = hl.common.ErrorMsg,
        ["@type"] = hl.syntax.Type,
        ["@type.builtin"] = hl.syntax.Type,
        ["@variable"] = hl.syntax.Identifier,
        ["@variable.builtin"] = hl.syntax.Identifier,
        ["@variable.member"] = hl.syntax.Identifier,
        ["@variable.parameter"] = hl.syntax.Identifier,
        -- ["@markup.heading.1.markdown"] = { fg = c.orange, fmt = "bold" },
        -- ["@markup.heading.2.markdown"] = { fg = c.brown, fmt = "bold" },
        -- ["@markup.heading.3.markdown"] = { fg = c.yellow, fmt = "bold" },
        -- ["@markup.heading.4.markdown"] = { fg = c.yellow, fmt = "bold" },
        -- ["@markup.heading.5.markdown"] = { fg = c.yellow, fmt = "bold" },
        -- ["@markup.heading.6.markdown"] = { fg = c.yellow, fmt = "bold" },
        -- ["@markup.heading.1.marker.markdown"] = { fg = c.orange, fmt = "bold" },
        -- ["@markup.heading.2.marker.markdown"] = { fg = c.brown, fmt = "bold" },
        -- ["@markup.heading.3.marker.markdown"] = { fg = c.yellow, fmt = "bold" },
        -- ["@markup.heading.4.marker.markdown"] = { fg = c.yellow, fmt = "bold" },
        -- ["@markup.heading.5.marker.markdown"] = { fg = c.yellow, fmt = "bold" },
        -- ["@markup.heading.6.marker.markdown"] = { fg = c.yellow, fmt = "bold" },
        -- ["@markup.emphasis"] = { fg = c.fg, fmt = "italic" },
        -- ["@markup.environment"] = { fg = c.fg },
        -- ["@markup.environment.name"] = { fg = c.fg },
        -- ["@markup.heading"] = { fg = c.orange, fmt = "bold" },
        -- ["@markup.link"] = { fg = c.blue },
        -- ["@markup.link.url"] = { fg = c.cyan, fmt = "underline" },
        -- ["@markup.list"] = { fg = c.red },
        -- ["@markup.math"] = { fg = c.fg },
        -- ["@markup.raw"] = { fg = c.green },
        -- ["@markup.strike"] = { fg = c.fg, fmt = "strikethrough" },
        -- ["@markup.strong"] = { fg = c.fg, fmt = "bold" },
        -- ["@markup.underline"] = { fg = c.fg, fmt = "underline" },
    }
    if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
        hl.lsp = {
            ["@lsp.type.comment"] = hl.treesitter["@comment"],
            ["@lsp.type.enum"] = hl.treesitter["@type"],
            ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
            ["@lsp.type.interface"] = hl.treesitter["@type"],
            ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
            ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
            ["@lsp.type.namespace"] = hl.treesitter["@module"],
            ["@lsp.type.parameter"] = hl.treesitter["@variable.parameter"],
            ["@lsp.type.property"] = hl.treesitter["@property"],
            ["@lsp.type.variable"] = hl.treesitter["@variable"],
            ["@lsp.type.macro"] = hl.treesitter["@function.macro"],
            ["@lsp.type.method"] = hl.treesitter["@function.method"],
            ["@lsp.type.number"] = hl.treesitter["@number"],
            ["@lsp.type.generic"] = hl.treesitter["@text"],
            ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
            ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
            ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
            ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
            ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
            ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
            ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
            ["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],
        }
    end
end

hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = { fg = c.orange },
    LspCxxHlGroupMemberVariable = { fg = c.orange },
    LspCxxHlGroupNamespace = { fg = c.blue },
    LspCxxHlSkippedRegion = { fg = c.grey },
    LspCxxHlSkippedRegionBeginEnd = { fg = c.red },

    DiagnosticError = { fg = c.diag_red, bg = c.bg_dark, fmt = "italic" },
    DiagnosticWarn = { fg = c.diag_brown, bg = c.bg_dark, fmt = "italic" },
    DiagnosticInfo = { fg = c.diag_blue, bg = c.bg_dark, fmt = "italic" },
    DiagnosticHint = { fg = c.diag_grey, bg = c.bg_dark, fmt = "italic" },

    DiagnosticVirtualTextError = { fg = c.diag_red, bg = c.bg_medium, fmt = "italic" },
    DiagnosticVirtualTextWarn = { fg = c.diag_brown, bg = c.bg_medium, fmt = "italic" },
    DiagnosticVirtualTextInfo = { fg = c.diag_blue, bg = c.bg_medium, fmt = "italic" },
    DiagnosticVirtualTextHint = { fg = c.diag_grey, bg = c.bg_medium, fmt = "italic" },

    DiagnosticUnderlineError = { fg = c.none, bg = c.none, fmt = "none", sp = c.red },
    DiagnosticUnderlineWarn = { fg = c.none, bg = c.none, fmt = "none", sp = c.brown },
    DiagnosticUnderlineInfo = { fg = c.none, bg = c.none, fmt = "none", sp = c.blue },
    DiagnosticUnderlineHint = { fg = c.none, bg = c.none, fmt = "none", sp = c.diag_grey },

    LspReferenceText = { bg = c.bg_light },
    LspReferenceWrite = { bg = c.bg_light },
    LspReferenceRead = { bg = c.bg_light },

    LspCodeLens = { fg = c.grey, fmt = cfg.code_style.comments },
    LspCodeLensSeparator = { fg = c.grey },
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.blink = {
    BlinkCmpLabel = { fg = c.fg },
    BlinkCmpLabelDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
    BlinkCmpLabelMatch = { fg = c.cyan },
    BlinkCmpDetail = { fg = c.light_grey },
    BlinkCmpKind              = hl.syntax.Include,
    BlinkCmpKindText          = hl.syntax.Identifier,
    BlinkCmpKindFile          = hl.syntax.Identifier,
    BlinkCmpKindField         = hl.syntax.Identifier,
    BlinkCmpKindEnumMember    = hl.syntax.Identifier,
    BlinkCmpKindProperty      = hl.syntax.Identifier,
    BlinkCmpKindClass         = hl.syntax.Type,
    BlinkCmpKindConstant      = hl.syntax.Constant,
    BlinkCmpKindConstructor   = hl.syntax.Special,
    BlinkCmpKindCopilot       = hl.syntax.Special,
    BlinkCmpKindEnum          = hl.syntax.Type,
    BlinkCmpKindFolder        = hl.syntax.Directory,
    BlinkCmpKindFunction      = hl.syntax.Function,
    BlinkCmpKindInterface     = hl.syntax.Type,
    BlinkCmpKindKeyword       = hl.syntax.Keyword,
    BlinkCmpKindMethod        = hl.syntax.Function,
    BlinkCmpKindModule        = hl.syntax.Include,
    BlinkCmpKindOperator      = hl.syntax.Operator,
    BlinkCmpKindReference     = hl.syntax.String,
    BlinkCmpKindSnippet       = hl.syntax.Special,
    BlinkCmpKindStruct        = hl.syntax.Structure,
    BlinkCmpKindTypeParameter = hl.syntax.Identifier,
    BlinkCmpKindValue         = hl.syntax.String,
    BlinkCmpKindVariable      = hl.syntax.Identifier,
}

hl.plugins.whichkey = {
    WhichKey = hl.syntax.Statement,
    WhichKeyGroup = hl.syntax.Function,
    WhichKeyTitle = hl.common.FloatBorder,
}

hl.plugins.signify = {
    SignifySignAdd = { fg = c.green, bg = c.bg_dark },
    SignifySignChange = { fg = c.blue, bg = c.bg_dark },
    SignifySignDelete = { fg = c.red, bg = c.bg_dark },
    SignifySignChangeDelete = { fg = c.blue, bg = c.bg_dark },
}

hl.plugins.gitgutter = {
    GitGutterAdd = { fg = c.green, bg = c.bg_dark },
    GitGutterChange = { fg = c.blue, bg = c.bg_dark },
    GitGutterDelete = { fg = c.red, bg = c.bg_dark },
    GitGutterChangeDelete = { fg = c.blue, bg = c.bg_dark },
}

hl.plugins.gitsigns = {
    GitSignsAdd = { fg = c.green, bg = c.bg_dark },
    GitSignsChange = { fg = c.blue, bg = c.bg_dark },
    GitSignsDelete = { fg = c.red, bg = c.bg_dark },
    GitSignsTopdelete = { fg = c.red, bg = c.bg_dark },
    GitSignsChangedelete = { fg = c.pink, bg = c.bg_dark },
    GitSignsUntracked = { fg = c.cyan, bg = c.bg_dark },
    GitSignsAddInline = { fg = c.none, bg = c.bg_green },
    GitSignsChangeLnInline = { fg = c.none, bg = c.bg_blue },
    GitSignsDeleteInline = { fg = c.none, bg = c.bg_red },
    GitSignsAddPreview = { fg = c.green, bg = c.bg_dark },
    GitSignsDeletePreview = { fg = c.red, bg = c.bg_red },
}

hl.plugins.matchup = {
    MatchParenCur = { fg = c.none, bg = c.none, fmt = "bold" },
    MatchWord = { fg = c.none, bg = c.none, fmt = "underline" },
    MatchWordCur = { fg = c.none, bg = c.none, fmt = "underline" },
}

hl.plugins.marks = {
    MarkSignHL = { fg = c.brown, bg = c.bg_dark, fmt = "bold" },
    MarkSignNumHL = hl.common.LineNr,
    MarkVirtTextHL = hl.plugins.lsp.DiagnosticHint,
}

hl.plugins.pounce = {
    PounceMatch = { fg = c.blue },
    PounceUnmatched = { fg = c.light_grey },
    PounceGap = { fg = c.light_grey, bg = c.none, fmt = "underline", sp = c.brown },
    PounceAccept = { fg = c.bg_base, bg = c.red },
    PounceAcceptBest = { fg = c.bg_base, bg = c.red },
}

hl.plugins.trouble = {
    TroubleIndentFoldClosed = hl.syntax.Comment,
    TroubleIndentFoldOpen = hl.syntax.Comment,
}

hl.plugins.undotree = {
    UndotreeSavedBig = { fg = c.blue, bg = c.none, fmt = "bold" },
    UndotreeNode = { fg = c.brown },
    UndotreeNodeCurrent = { fg = c.red },
    UndotreeSeq = { fg = c.green },
    UndotreeNext = { fg = c.blue },
    UndotreeTimeStamp = { fg = c.grey },
    UndotreeHead = { fg = c.yellow },
    UndotreeBranch = { fg = c.yellow },
    UndotreeCurrent = { fg = c.cyan },
    UndotreeSavedSmall = { fg = c.blue },
}

-- comment
hl.plugins.diffview = {
    DiffviewFilePanelTitle = { fg = c.blue, fmt = "bold" },
    DiffviewFilePanelCounter = { fg = c.purple, fmt = "bold" },
    DiffviewFilePanelFileName = { fg = c.fg },
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath = { fg = c.grey },
    DiffviewFilePanelPath = { fg = c.grey },
    DiffviewFilePanelInsertions = { fg = c.green },
    DiffviewFilePanelDeletions = { fg = c.red },
    DiffviewStatusAdded = { fg = c.green },
    DiffviewStatusUntracked = { fg = c.blue },
    DiffviewStatusModified = { fg = c.blue },
    DiffviewStatusRenamed = { fg = c.blue },
    DiffviewStatusCopied = { fg = c.blue },
    DiffviewStatusTypeChange = { fg = c.blue },
    DiffviewStatusUnmerged = { fg = c.blue },
    DiffviewStatusUnknown = { fg = c.red },
    DiffviewStatusDeleted = { fg = c.red },
    DiffviewStatusBroken = { fg = c.red },
}

hl.plugins.telescope = {
    TelescopeBorder = hl.common.FloatBorder,
    TelescopeTitle = hl.common.FloatTitle,
    TelescopePromptPrefix = { fg = c.light_grey, bg = c.none, fmt = "bold" },
    TelescopeMatching = { fg = c.cyan, bg = c.none },
    TelescopeSelection = { bg = c.select },
    TelescopeSelectionCaret = { fg = c.red, bg = c.select },
    TelescopeMultiSelection = { fg = c.yellow },
    TelescopeMultiIcon = { fg = c.light_grey },
}

hl.plugins.dashboard = {
    DashboardProjectTitle = { fg = c.orange, bg = c.none },
    DashboardMruTitle = { fg = c.orange, bg = c.none },
    DashboardShortCut = hl.syntax.Exception,
    DashboardFooter = hl.syntax.Comment,
}

hl.plugins.mini = {
    MiniFilesBorder = hl.common.FloatBorder,
    MiniFilesBorderModified = hl.syntax.Number,
    MiniFilesCursorLine = { fg = c.none, bg = c.select },
    MiniFilesDirectory = hl.common.Directory,
    MiniFilesFile = { fg = c.fg },
    MiniFilesNormal = hl.common.NormalFloat,
    MiniFilesTitle = hl.common.FloatTitle,
    MiniFilesTitleFocused = { fg = c.brown, bg = c.none },
}

hl.plugins.outline = {
    OutlineFoldMarker = hl.syntax.Comment,
    OutlineGuides = hl.common.Whitespace,
}

hl.plugins.colorful_winsep = {
    ColorfulWinSep = { fg = c.orange, bg = c.bg_light, fmt = "bold" },
}

hl.plugins.treesitter_context = {
    TreesitterContext = { bg = c.none },
    TreesitterContextSeparator = hl.common.Whitespace,
}

hl.langs.markdown = {
    markdownH1 = { fg = c.orange, fmt = "bold" },
    markdownH2 = { fg = c.brown, fmt = "bold" },
    markdownH3 = { fg = c.yellow, fmt = "bold" },
    markdownH4 = { fg = c.yellow, fmt = "bold" },
    markdownH5 = { fg = c.yellow, fmt = "bold" },
    markdownH6 = { fg = c.yellow, fmt = "bold" },
    markdownUrl = { fg = c.grey, fmt = "underline" },
    markdownItalic = { fg = c.yellow, fmt = "none" },
    markdownItalicDelimiter = { fg = c.grey },
    markdownBold = { fg = c.none, fmt = "bold" },
    markdownBoldDelimiter = { fg = c.grey },
    markdownCode = { fg = c.green, fmt = "italic" },
    markdownCodeBlock = { fg = c.green, bg = c.bg_medium },
    markdownCodeDelimiter = { fg = c.light_grey },
    markdownBlockquote = { fg = c.grey },
    markdownHeadingDelimiter = { fg = c.grey },
    markdownHeadingRule = { fg = c.grey },
    markdownId = { fg = c.yellow },
    markdownIdDeclaration = { fg = c.cyan },
    markdownLinkText = { fg = c.cyan },
    markdownLinkDelimiter = { fg = c.grey },
    markdownLinkTextDelimiter = { fg = c.grey },
    markdownListMarker = { fg = c.pink },
    markdownOrderedListMarker = { fg = c.pink },
    markdownRule = { fg = c.grey },
    markdownUrlDelimiter = { fg = c.grey },
    markdownUrlTitleDelimiter = { fg = c.yellow },
    markdownAutomaticLink = { fg = c.cyan },
}

hl.langs.vim = {
    vimIsCommand = hl.common.Normal,
    vimFunction = hl.syntax.Function,
    vimUserFunc = hl.syntax.Function,
    vimFuncName = hl.syntax.Function,
    vimLet = { fg = c.brown },
    vimMap = { fg = c.blue },
    vimNotation = { fg = c.cyan },
    vimMapLhs = { fg = c.green },
    vimMapRhs = { fg = c.green },
    vimSetEqual = { fg = c.yellow },
    vimSetSep = hl.common.Normal,
    vimOption = { fg = c.cyan },
    vimUserAttrbKey = { fg = c.yellow },
    vimUserAttrb = { fg = c.green },
    vimAutoCmdSfxList = { fg = c.cyan },
    vimSynType = { fg = c.brown },
    vimHiBang = { fg = c.brown },
    vimSet = { fg = c.yellow },
    vimMapModKey = { fg = c.orange },
    vimVar = { fg = c.fg, fmt = cfg.code_style.variables },
    vimCommentTitle = { fg = c.light_grey, fmt = cfg.code_style.comments },
}

hl.langs.toml = {
    tomlTable = { fg = c.red, fmt = "bold" },
    tomlTableArray = { fg = c.red, fmt = "bold" },
    tomlKey = hl.syntax.Identifier,
    tomlString = hl.syntax.String,
    tomlBoolean = hl.syntax.Boolean,
}

hl.langs.yaml = {
    yamlKey = { fg = c.brown },
    yamlConstant = hl.syntax.Constant,
}

hl.langs.json = {
    jsonKeyword = { fg = c.fg },
    jsonQuote = { fg = c.light_grey },
    jsonBraces = { fg = c.fg },
    jsonNull = { fg = c.red },
}

hl.langs.hjson = {
    hjsonString = hl.syntax.String,
    hjsonQuote = hl.syntax.String,
    hjsonKeyword = hl.syntax.Keyword,
    hjsonStringUQ = { fg = c.fg },
    hjsonBraces = { fg = c.fg },
}

hl.langs.xml = {
    xmltag = { fg = c.green },
    xmlendtag = { fg = c.blue },
    xmltagname = { fg = c.brown, fmt = "italic" },
    xmlequal = { fg = c.brown },
    xmlattrib = { fg = c.cyan },
    xmlentity = { fg = c.red },
    xmlentitypunct = { fg = c.red },
    xmldoctypedecl = { fg = c.grey },
    xmldoctypekeyword = { fg = c.blue, fmt = "italic" },
    xmlcdatastart = { fg = c.grey },
    xmlcdatacdata = { fg = c.blue },
}

hl.langs.html = {
    htmlH1 = hl.langs.markdown.markdownH1,
    htmlH2 = hl.langs.markdown.markdownH2,
    htmlH3 = hl.langs.markdown.markdownH3,
    htmlH4 = hl.langs.markdown.markdownH4,
    htmlH5 = hl.langs.markdown.markdownH5,
    htmlH6 = hl.langs.markdown.markdownH6,
    htmlLink = { fg = c.brown, bg = c.none, fmt = "underline" },
    htmlBold = { fg = c.none, bg = c.none, fmt = "bold" },
    htmlBoldUnderline = { fg = c.none, bg = c.none, fmt = "bold,underline" },
    htmlBoldItalic = { fg = c.none, bg = c.none, fmt = "bold,italic" },
    htmlBoldUnderlineItalic = { fg = c.none, bg = c.none, fmt = "bold,underline,italic" },
    htmlUnderline = { fg = c.none, bg = c.none, fmt = "underline" },
    htmlUnderlineItalic = { fg = c.none, bg = c.none, fmt = "underline,italic" },
    htmlItalic = { fg = c.none, bg = c.none, fmt = "italic" },
    htmlTag = { fg = c.light_grey, bg = c.none },
    htmlTagN = { fg = c.light_grey, bg = c.none },
    htmlEndTag = { fg = c.light_grey, bg = c.none },
    htmlArg = { fg = c.fg, bg = c.none },
    htmlScriptTag = { fg = c.blue, bg = c.none },
    htmlSpecialTagName = { fg = c.red, fmt = "italic" },
}

hl.langs.css = {
    cssAtKeyword = hl.syntax.Keyword,
    cssAtRule = hl.syntax.Exception,
    cssAttrComma = { fg = c.fg },
    cssBraces = hl.syntax.Delimiter,
    cssNoise = hl.syntax.Delimiter,
    cssIdentifier = hl.syntax.Statement,
    cssClassName = hl.syntax.Statement,
    cssClassNameDot = hl.syntax.Statement,
    cssFunctionName = { fg = c.green },
    cssFunction = { fg = c.green },
    cssAttr = { fg = c.brown },
    cssProp = { fg = c.fg },
    cssTagName = { fg = c.yellow },
    cssCustomProp = { fg = c.fg },
    cssCommonAttr = { fg = c.blue },
    cssPseudoClassId = hl.syntax.Type,
    cssPseudoClassFn = { fg = c.green },
    cssPseudoClass = { fg = c.cyan },
    cssImportant = { fg = c.brown, fmt = "italic" },
    cssSelectorOp = { fg = c.yellow },
    cssSelectorOp2 = { fg = c.yellow },
    cssColor = { fg = c.blue },
    cssAttributeSelector = { fg = c.cyan },
    cssUnitDecorators = { fg = c.fg },
    cssValueLength = { fg = c.pink },
    cssValueInteger = { fg = c.pink },
    cssValueNumber = { fg = c.pink },
    cssValueAngle = { fg = c.pink },
    cssValueTime = { fg = c.pink },
    cssValueFrequency = { fg = c.pink },
    cssVendor = { fg = c.cyan },
}

hl.langs.shell = {
    shRange = { fg = c.fg },
    shTestOpr = { fg = c.brown },
    shOption = { fg = c.cyan },
    bashStatement = { fg = c.brown },
    shOperator = hl.syntax.Operator,
    shQuote = { fg = c.moss },
    shSet = { fg = c.brown },
    shSetList = { fg = c.fg },
    shSnglCase = { fg = c.brown },
    shVariable = hl.syntax.Identifier,
    shVarAssign = { fg = c.brown },
    shCmdSubRegion = { fg = c.green },
    shCommandSub = { fg = c.fg },
    shFunctionOne = { fg = c.green },
    shDerefSimple = { fg = c.fg },
    shFunctionKey = { fg = c.red, fmt = "italic" },
}

hl.langs.lua = {
    luaFunc = hl.syntax.Function,
    luaFunction = hl.syntax.Function,
    luaTable = { fg = c.fg },
    luaIn = { fg = c.red, fmt = "italic" },
}

hl.langs.rust = {
    rustModPath = hl.syntax.Identifier,
    rustSelf = hl.syntax.Type,
    rustSigil = hl.syntax.Exception,
    rustMacroVariable = hl.syntax.Identifier,
    rustPanic = { fg = c.red },
}

hl.langs.gdscript = {
    gdscriptOperator = hl.syntax.Operator,
    gdscriptBlockStart = hl.syntax.Statement,
    gdscriptNode = hl.syntax.Structure,
    gdResourceNumber = hl.syntax.Number,
    gdResourceSectionName = hl.syntax.Type,
    gdResourceSectionAttributeName = hl.syntax.Identifier,
    gdResourceString = hl.syntax.String,
}

function M.setup()
    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    if hl.lsp then
        vim_highlights(hl.lsp)
    end
    for _, group in pairs(hl.langs) do
        vim_highlights(group)
    end
    for _, group in pairs(hl.plugins) do
        vim_highlights(group)
    end

    -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
    local function replace_color(prefix, color_name)
        if not color_name then
            return ""
        end
        if color_name:sub(1, 1) == "$" then
            local name = color_name:sub(2, -1)
            color_name = c[name]
            if not color_name then
                vim.schedule(function()
                    vim.notify(
                        'moksha.nvim: unknown color "' .. name .. '"',
                        vim.log.levels.ERROR,
                        { title = "moksha.nvim" }
                    )
                end)
                return ""
            end
        end
        return prefix .. "=" .. color_name
    end

    for group_name, group_settings in pairs(vim.g.moksha_config.highlights) do
        vim.api.nvim_command(
            string.format(
                "highlight %s %s %s %s %s",
                group_name,
                replace_color("guifg", group_settings.fg),
                replace_color("guibg", group_settings.bg),
                replace_color("guisp", group_settings.sp),
                replace_color("gui", group_settings.fmt)
            )
        )
    end
end

return M
