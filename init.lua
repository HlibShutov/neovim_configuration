require('remap')
require('plugins')
print("lua UwU")



-- vim.g.material_style = "deep ocean"

-- vim.g.user_emmet_mode = 'a'
-- vim.g.user_emmet_install_global = 0

-- Create an autocommand for FileType
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = { "html", "css" },
--  command = "EmmetInstall"
--})
vim.cmd('colorscheme tokyonight-night')
vim.cmd('set number')
vim.cmd('set relativenumber')
vim.cmd('set termguicolors')
vim.cmd('set nowrap')
--vim.cmd('Neotree')


require('nvim-treesitter.configs').setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
require('colorizer').setup()
require("colorizer").attach_to_buffer(0, { mode = "background", css = true})
require('lualine').setup()
--require("emmet-language-server").setup()


require('lspconfig').pyright.setup{}
require('lspconfig').vimls.setup{}

require('cmp').setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
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

local capabilities = require('cmp_nvim_lsp').default_capabilities()



require('local-highlight').setup({
    insert_mode = true,
})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
