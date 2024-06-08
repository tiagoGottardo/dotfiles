lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "kanagawa"
lvim.builtin.terminal.size = 90
lvim.builtin.terminal.direction = "vertical"

lvim.keys.normal_mode["<C-g>"] = "<cmd>Telescope live_grep<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.leader = "space"

vim.opt.relativenumber = true -- relative line numbers


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
  { "catppuccin/nvim",       name = "catppuccin" },
  { "rebelot/kanagawa.nvim" },
  --{ "Exafunction/codeium.vim" },
}
