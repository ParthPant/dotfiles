local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local format = augroup("Format", { clear = true })
autocmd("BufWritePost", {
	command = "FormatWrite",
	group = format,
})

-- autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
-- 	command = "if mode() != 'c' | checktime | endif",
-- 	group = format,
-- })
