lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
lvim.builtin.terminal.size = 90
lvim.builtin.terminal.direction = "vertical"

lvim.keys.normal_mode["<C-g>"] = "<cmd>Telescope live_grep<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.leader = "space"

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

lvim.lsp.on_attach_callback = function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

  if filetype == "c" or filetype == "cpp" then
    -- Disable LSP for C/C++
    vim.lsp.stop_client(client.id)
  end
end

local function insert_double_quotes()
  local col = vim.fn.col('.')
  vim.api.nvim_put({ '""' }, 'c', false, true)
  vim.fn.cursor(0, col + 1);
end

lvim.keys.insert_mode["<M-ç>"] = function()
  insert_double_quotes()
end


vim.opt.relativenumber = true -- relative line numbers

vim.opt.clipboard = "unnamedplus"

local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.cursorline = true
lvim.builtin.nvimtree.setup.view.width = 30
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

lvim.plugins = {
  { "Pocco81/auto-save.nvim" },
  { "catppuccin/nvim",         name = "catppuccin" },
  { "rebelot/kanagawa.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  -- { "Exafunction/codeium.vim" },
}
