require('remap')
require('plugins')
require('lsp')
-- require('frontend')

vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and "; " or ":") .. vim.env.PATH

vim.cmd('colorscheme tokyonight-night')
vim.cmd('set number')
vim.cmd('set relativenumber')
vim.cmd('set termguicolors')
vim.cmd('set nowrap')
--vim.cmd('Neotree')

require("autoclose").setup()
require('nvim-treesitter.configs').setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
require('colorizer').setup()
require("colorizer").attach_to_buffer(0, { mode = "background", css = true})
require('lualine').setup()
-- HolyC lang
vim.cmd("syntax enable")
vim.filetype.add({
    extension = {
        hc = "hc",
    },
})

-- Set indentation for JavaScript to 4 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript", "javascriptreact", "typescript", "typescriptreact", "scss"}, -- You can add more patterns if needed
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})

-- Displaing errors
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
  end
})


require('local-highlight').setup({
    insert_mode = true,
})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

require('telescope').setup{}
