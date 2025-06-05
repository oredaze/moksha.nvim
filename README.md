<h1 align="center">
<picture>
  <img height="150" src="https://github.com/oredaze/moksha.nvim/assets/20145075/5dfe9607-977f-48d9-836f-88a556ec57a3">
</picture>
</h1>

<h4><div align="right">
    <a href="#installation">Installation</a>
    <span> | </span>
    <a href="#default-configuration">Configuration</a>
    <span> | </span>
    <a href="#customization">Customization</a>
    <span> &nbsp;&nbsp;&nbsp; &nbsp; </span>
</div></h4>

Neovim theme for the ascended, written in lua. Code courtesy of [OneDark](https://github.com/navarasu/onedark.nvim)

Made and optimized for [VimKnight](https://github.com/oredaze/VimKnight)

Can customize colors and code styles

## Showcase
<p float="left">
<img width="412" src="https://user-images.githubusercontent.com/????.png">
</div></p>

## Installation
Install via your favourite package manager

```lua
-- Using Lazy
{
  "oredaze/moksha.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('moksha').setup {}
    -- Enable theme
    require('moksha').load()
  end
}
```

```vim
" Using Vim-Plug
Plug 'oredaze/moksha.nvim'
```

```lua
-- Using Packer
use 'oredaze/moksha.nvim'
```

## Configuration

### Enable theme

```lua
-- Lua
require('moksha').load()
```

```vim
" Vim
colorscheme moksha
```

## Default Configuration

```lua
-- Lua
require('moksha').setup  {
    term_colors = true, -- Change terminal color as per the selected theme style

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        bool = 'italic',
        chars = 'bold',
        keywords = 'none',
        exception = 'bold',
        functions = 'italic',
        macros = 'bold,italic',
        strings = 'italic',
        types = 'italic',
        tags = 'bold',
        variables = 'none'
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups
}
```

## Customization

Example custom colors and Highlights config

```lua
require('moksha').setup {
  colors = {
    bright_orange = "#ff8800",    -- define a new color
    green = '#00ffaa',            -- redefine an existing color
  },
  highlights = {
    ["@lsp.type.keyword"] = { fg = "$green" },
    ["@lsp.type.property"] = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
    ["@lsp.type.function"] =  {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
    ["@lsp.type.method"] = { link = "@function" },
  -- To add language specific config
    ["@lsp.type.variable.go"] = { fg = "none" },
  }
}
```
Note that TreeSitter keywords have been changed after neovim version 0.8 and onwards.
Lowercase words should be used separated with '.'

## License

[MIT](https://choosealicense.com/licenses/mit/)
