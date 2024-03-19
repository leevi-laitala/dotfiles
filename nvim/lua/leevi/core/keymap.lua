vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })

--vim.keymap.set("n", "<leader>mp", vim.cmd.MarkdownPreview)
--vim.keymap.set("n", "<leader>ms", vim.cmd.MarkdownPreviewStop)
--
---- Trouble
--vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
--  {silent = true, noremap = true}
--)
--vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
--  {silent = true, noremap = true}
--)
--vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
--  {silent = true, noremap = true}
--)
--vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
--  {silent = true, noremap = true}
--)
--vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
--  {silent = true, noremap = true}
--)
--vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
--  {silent = true, noremap = true}
--)
--
---- CHAD Tree
--vim.keymap.set("n", "<leader>c", vim.cmd.CHADopen)
