# nvim-treesitter-svelte

Use the `svelte5` parser for Svelte files in `nvim-treesitter`.

This plugin uses `themixednuts/tree-sitter-htmlx` under the hood and ships `svelte5` queries for:

- highlights
- injections
- indents
- folds
- locals
- `nvim-treesitter-context`
- `nvim-treesitter-textobjects`

It supports normal Svelte filenames like `Component.svelte`, `+page.server.svelte`, and
`Component.spec.svelte`, and it also adds filetype detection for `*.svelte.ts` and `*.svelte.js`.

## Install

With `lazy.nvim`:

```lua
{
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
},
{
  'themixednuts/nvim-treesitter-svelte',
  main = 'nvim-treesitter-svelte',
  lazy = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    filetypes = { 'svelte' },
  },
}
```

Install the parser:

```vim
:TSInstall svelte5
```

For embedded language highlighting, also install the parsers you use inside Svelte files:

```vim
:TSInstall javascript typescript css scss json regex comment
```

Restart Neovim after the first install, or run:

```lua
require('nvim-treesitter-svelte').load()
```

## Notes

- buffer `filetype` stays `svelte`
- Tree-sitter language becomes `svelte5`
- `nvim-treesitter-context` and `nvim-treesitter-textobjects` work without extra query setup

If you want the parser installed without taking over Svelte buffers yet, omit `filetypes` from the
setup options.

## Configuration

```lua
require('nvim-treesitter-svelte').setup({
  filetypes = { 'svelte' },
  parser_name = 'svelte5',
  detect_filetypes = true,
})
```
