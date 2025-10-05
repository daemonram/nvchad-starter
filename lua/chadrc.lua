-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "tundra",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false
  },
  telescope = { style = "bordered" },
 statusline = {
   theme = "default", -- default/vscode/vscode_colored/minimal
   -- default/round/block/arrow separators work only for default statusline theme
   -- round and block will work for minimal theme only
   separator_style = "default",
   order = { "mode", "f", "git", "%=", "lsp_msg", "%=", "lsp", "cursor", "lines"},
   modules = {
     lines = function()
       return string.format("[%d lines]", vim.fn.line('$'))
     end,
     f = "%#St_Mode#%F %#StText#"
   }
 }
}

return M
