local M = {}

M.styles_list = { 'dark', 'medium', 'light' }

---Change moksha option (vim.g.moksha_config.option)
---It can't be changed directly by modifying that field due to a Neovim lua bug with global variables (moksha_config is a global variable)
---@param opt string: option name
---@param value any: new value
function M.set_options(opt, value)
    local cfg = vim.g.moksha_config
    cfg[opt] = value
    vim.g.moksha_config = cfg
end

---Apply the colorscheme (same as ':colorscheme moksha')
function M.colorscheme()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.o.termguicolors = true
    vim.g.colors_name = "moksha"
    require('moksha.highlights').setup()
    require('moksha.terminal').setup()
end

---Toggle between moksha styles
function M.toggle()
    local index = vim.g.moksha_config.toggle_style_index + 1
    if index > #vim.g.moksha_config.toggle_style_list then index = 1 end
    M.set_options('style', vim.g.moksha_config.toggle_style_list[index])
    M.set_options('toggle_style_index', index)
    vim.api.nvim_command('colorscheme moksha')
end

local default_config = {
    -- Main options --
    style = 'medium',    -- choose between 'dark', 'medium', 'light'
    toggle_style_key = nil,
    toggle_style_list = M.styles_list,
    term_colors = true,      -- if true enable the terminal

    -- Changing Formats --
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

---Setup moksha.nvim options, without applying colorscheme
---@param opts table: a table containing options
function M.setup(opts)
    if not vim.g.moksha_config or not vim.g.moksha_config.loaded then    -- if it's the first time setup() is called
        vim.g.moksha_config = vim.tbl_deep_extend('keep', vim.g.moksha_config or {}, default_config)
        M.set_options('loaded', true)
        M.set_options('toggle_style_index', 0)
    end
    if opts then
        vim.g.moksha_config = vim.tbl_deep_extend('force', vim.g.moksha_config, opts)
        if opts.toggle_style_list then    -- this table cannot be extended, it has to be replaced
            M.set_options('toggle_style_list', opts.toggle_style_list)
        end
    end
    if vim.g.moksha_config.toggle_style_key then
      vim.api.nvim_set_keymap('n', vim.g.moksha_config.toggle_style_key, '<cmd>lua require("moksha").toggle()<cr>', { noremap = true, silent = true })
    end
end

function M.load()
  vim.api.nvim_command('colorscheme moksha')
end

return M
