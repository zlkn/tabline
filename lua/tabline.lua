-- nvim-tabline
-- David Zhang <https://github.com/crispgm>

local M = {}
local fn = vim.fn

M.options = {}

local function tabline(options)
	local s = ""
	local custom_text = "hello world"
	s = custom_text .. "%#TabLineFill#"
	s = s .. "%#TabLineFill#"
	return s
end

function M.setup(optoins)
	M.options = vim.tbl_extend("force", M.options, user_options)
	M.has_devicons, M.devicons = pcall(require, "nvim-web-devicons")

	function _G.nvim_tabline()
		return tabline(M.options)
	end

	vim.o.tabline = "%!v:lua.nvim_tabline()"

	vim.g.loaded_nvim_tabline = 1
end

return M
