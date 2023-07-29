local M = {}

M.luasnip = function(opts)
  require("luasnip").config.set_config(opts)

  -- vscode format
  -- require("luasnip.loaders.from_vscode").lazy_load()
  -- require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

  -- snipmate format
  -- require("luasnip.loaders.from_snipmate").load()
  -- require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

  -- lua format
  --require("luasnip.loaders.from_lua").load()
  -- require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

  -- my snippets
  require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/custom/snippets"})
  require('luasnip').filetype_extend("tex", { "toel" })
  require('luasnip').filetype_extend("tex", { "gd" })
  require('luasnip').filetype_extend("tex", { "edif" })
  require('luasnip').filetype_extend("tex", { "prob" })
  require('luasnip').filetype_extend("tex", { "afvc" })
  require('luasnip').filetype_extend("javascript", { "html" })
  require('luasnip').filetype_extend("javascript", { "javascriptreact" })
  require('luasnip').filetype_extend(".ejs", { "html" })

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      if
        require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require("luasnip").session.jump_active
      then
        require("luasnip").unlink_current()
      end
    end,
  })
end

return M
