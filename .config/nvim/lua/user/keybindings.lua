-- Keybindings
vim.keymap.set("n", "<c-s>", "<cmd>write<cr>", { desc = "Save" })
vim.keymap.set({ "n", "x" }, "cp", '"+y', { desc = "Copy to Clipboard" })
vim.keymap.set({ "n", "x" }, "cv", '"+p', { desc = "Paste from Clipboard" })
vim.keymap.set("n", "<leader>f", "<cmd>:Format<cr>", { desc = "Format Buffer" })

-- vim.keymap.set("n", "<c-h>", "<c-w>h")
-- vim.keymap.set("n", "<c-j>", "<c-w>j")
-- vim.keymap.set("n", "<c-k>", "<c-w>k")
-- vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set("n", "<space><space>", "<cmd> NvimTreeToggle<CR>")

vim.keymap.set("n", "<c-h>", "<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<c-j>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set("n", "<c-k>", "<cmd> TmuxNavigateUp<CR>")
vim.keymap.set("n", "<c-l>", "<cmd> TmuxNavigateRight<CR>")

-- quickfix lists
vim.keymap.set("n", "]q", "<cmd>:cnext<cr>")
vim.keymap.set("n", "[q", "<cmd>:cprev<cr>")
vim.keymap.set("n", "]Q", "<cmd>:clast<cr>")
vim.keymap.set("n", "[Q", "<cmd>:cfirst<cr>")
vim.keymap.set("n", "<leader>cc", "<cmd>:cclose<cr>")
vim.keymap.set("n", "<leader>co", "<cmd>:copen<cr>")

-- location lists
vim.keymap.set("n", "]l", "<cmd>:lnext<cr>")
vim.keymap.set("n", "[l", "<cmd>:lprev<cr>")
vim.keymap.set("n", "]L", "<cmd>:llast<cr>")
vim.keymap.set("n", "[L", "<cmd>:lfirst<cr>")
vim.keymap.set("n", "<leader>lc", "<cmd>:lclose<cr>")
vim.keymap.set("n", "<leader>lo", "<cmd>:lopen<cr>")

vim.keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>?", "<cmd>Telescope oldfiles<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
vim.keymap.set("n", "<leader>cd", ':lua require("user.telescopecd").cd({})<cr>')
vim.keymap.set("n", "<space>e", ':lua vim.diagnostic.open_float(0, {scope="line"})<cr>')

vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

-- LSP bindings
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Displays hover information about the symbol under the cursor
		bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

		-- Jump to the definition
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

		-- Jump to declaration
		bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

		-- Lists all the implementations for the symbol under the cursor
		bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

		-- Jumps to the definition of the type symbol
		bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

		-- Lists all the references
		bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

		-- Displays a function's signature information
		bufmap("n", "S", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

		-- Renames all references to the symbol under the cursor
		bufmap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>")

		-- Selects a code action available at the current cursor position
		bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		bufmap("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")

		-- Show diagnostics in a floating window
		bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

		-- Move to the previous diagnostic
		bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

		-- Move to the next diagnostic
		bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

		-- Send diagnostics to quickfix list
		bufmap("n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<cr>")
		bufmap("n", "<leader>dq", "<cmd>lua vim.diagnostic.setqflist()<cr>")
	end,
})

-- Terminal
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
