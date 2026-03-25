# nvim-treesitter-svelte

Opt-in Svelte support for `nvim-treesitter` using `themixednuts/tree-sitter-htmlx`.

This repo registers a separate parser name, `svelte5`, and ships matching queries for it.
It does not modify `nvim-treesitter`'s built-in `svelte` parser unless you explicitly map the
`svelte` filetype to `svelte5` in your config.

It also adds filetype detection for `*.svelte.ts` and `*.svelte.js`. Names like
`+page.server.svelte` and `*.spec.svelte` already work because they still end in `.svelte`.

## Install

Example with `lazy.nvim`:

```lua
{
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
},
{
  dir = 'E:/Projects/nvim-treesitter-svelte',
  main = 'nvim-treesitter-svelte',
  lazy = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    filetypes = { 'svelte' },
  },
}
```

Then install the parser:

```vim
:TSInstall svelte5
```

After the first install, restart Neovim or run:

```lua
require('nvim-treesitter-svelte').load()
```

If you only want the parser available without taking over `.svelte` files yet, omit `filetypes`.

## What `setup()` does

- registers a custom parser named `svelte5`
- points it at `themixednuts/tree-sitter-htmlx` in `crates/tree-sitter-svelte`
- optionally maps Neovim filetypes like `svelte` to `svelte5`
- adds filetype detection for `.svelte.ts` and `.svelte.js`
- provides queries under `queries/svelte5`

## Configuration

```lua
require('nvim-treesitter-svelte').setup({
  parser_name = 'svelte5',
  filetypes = { 'svelte' },
  install_info = {
    url = 'https://github.com/themixednuts/tree-sitter-htmlx',
    location = 'crates/tree-sitter-svelte',
    revision = '3be6db3dc94478b089a64e59e4d855fc3041a7be',
  },
})
```
