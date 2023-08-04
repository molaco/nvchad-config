local M = {}

M.vimtex = {
  n = {
    ["<leader>ll"] = { "<cmd> VimtexCompile <CR>", "vimtex-compile"},
    ["<leader>lk"] = { "<cmd> VimtexView <CR>", "vimtex-view"},
    ["<leader>kk"] = { "<cmd> set spell spelllang=es <CR>", "set spell"},
    ["<leader>kl"] = { "<cmd> set nospell <CR>", "set spell"},
  }
}

M.general = {
  n = {
    -- Spell
    ["<leader>lp"] = { "[s1z=`]a", "spell correction"},

    -- Lsp virtual text
    ["<leader>lt"] = { "<cmd> lua vim.diagnostic.config({ virtual_text = false, }) <CR>", "disable lsp virtual-text"},
    ["<leader>lr"] = { "<cmd> lua vim.diagnostic.config({ virtual_text = true, }) <CR>", "enable lsp virtual-text"},

    -- Lsp inline diagnostics 
    ["<leader>ln"] = { "<cmd> lua vim.diagnostic.goto_next() <CR>", "next lsp diagnostic"},
    ["<leader>lm"] = { "<cmd> lua vim.diagnostic.goto_prev() <CR>", "previous lsp diagnostic"},
    ["<leader>lo"] = { "<cmd> lua vim.diagnostic.open_float() <CR>", "open_float lsp diagnostic"},

    -- Vertical Movement
    ["<C-d>"] = { "<C-d>zz", "page down + center"},
    ["<C-u>"] = { "<C-u>zz", "page up + center"},
  }
}

return M
