local M = {}

local defaults = {
  parser_name = 'svelte5',
  symbol_name = 'svelte',
  filetypes = { 'svelte' },
  detect_filetypes = true,
  install_info = {
    url = 'https://github.com/themixednuts/tree-sitter-htmlx',
    location = 'crates/tree-sitter-svelte',
    revision = '8e1a2750c5d40a8f5653068f968d2eeca65799c1',
  },
}

local function register_parser(opts)
  local parsers = require('nvim-treesitter.parsers')
  local parser = parsers[opts.parser_name] or {}

  parser.install_info = vim.tbl_deep_extend('force', parser.install_info or {}, opts.install_info)
  parser.tier = parser.tier or 3

  parsers[opts.parser_name] = parser
end

function M.load(opts)
  opts = vim.tbl_deep_extend('force', {}, defaults, opts or {})

  local paths = vim.api.nvim_get_runtime_file('parser/' .. opts.parser_name .. '.*', false)
  local path = paths[1]

  if not path then
    return false
  end

  return vim.treesitter.language.add(opts.parser_name, {
    path = path,
    symbol_name = opts.symbol_name,
  })
end

local function register_filetypes(opts)
  if not opts.detect_filetypes then
    return
  end

  vim.filetype.add({
    extension = {
      svelte = 'svelte',
    },
    pattern = {
      ['.+%.svelte%.js'] = 'svelte',
      ['.+%.svelte%.ts'] = 'svelte',
    },
  })
end

function M.setup(opts)
  opts = vim.tbl_deep_extend('force', {}, defaults, opts or {})

  register_filetypes(opts)
  register_parser(opts)

  vim.api.nvim_create_autocmd('User', {
    group = vim.api.nvim_create_augroup('nvim-treesitter-svelte', { clear = true }),
    pattern = 'TSUpdate',
    callback = function()
      register_parser(opts)
    end,
  })

  if opts.filetypes and #opts.filetypes > 0 then
    vim.treesitter.language.register(opts.parser_name, opts.filetypes)
  end

  M.load(opts)

  return opts.parser_name
end

return M
