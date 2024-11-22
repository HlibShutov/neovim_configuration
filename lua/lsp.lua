local lspconfig = require('lspconfig')

lspconfig.omnisharp.setup {
    cmd = { "omnisharp" },  -- Make sure this points to the right executable
    filetypes = { "cs" },   -- Add filetypes that OmniSharp should support
    root_dir = lspconfig.util.root_pattern(".sln", ".csproj", ".git"),  -- Root pattern for projects
}

lspconfig.ts_ls.setup{}
lspconfig.html.setup{}
lspconfig.pyright.setup{}
lspconfig.vimls.setup{}
lspconfig.html.setup{}
lspconfig.intelephense.setup{
  root_dir = function(_)
    return vim.loop.cwd()
  end,
}
lspconfig.marksman.setup{}
require('setup/rust_tools_setup')
require('setup/jdtls_setup')

require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()

local cmp = require('cmp')
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = require('cmp').mapping.preset.insert({
      ['<C-b>'] = require('cmp').mapping.scroll_docs(-4),
      ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
      ['<C-Space>'] = require('cmp').mapping.complete(),
      ['<C-e>'] = require('cmp').mapping.abort(),
      ['<CR>'] = require('cmp').mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = require('cmp').config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
})
