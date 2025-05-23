-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ~/.config/nvim/lua/config/colors.lua

-- 1. List the schemes you want rotated
local schemes = {
  "tokyonight",
  "tokyonight-day",
  "tokyonight-moon",
  "tokyonight-night",
  "tokyonight-storm",
  "blue",
  "darkblue",
  "default",
  "desert",
  "elflord",
  "evening",
  "habamax",
  "industry",
  "koehler",
  "lunaperche",
  "morning",
  "murphy",
  "pablo",
  "peachoff",
  "quiet",
  "retrobox",
  "ron",
  "shine",
  "slate",
  "sorbet",
  "torte",
  "unokai",
  "vim",
  "wildcharm",
  "zaibatsu",
  "zellner",
  "catppuccin-frappe",
  "catppuccin-latte",
  "cattpuccin-macchiato",
  "catppuccin-mocha",
  "catppuccin",
}

-- 2. Seed randomness
math.randomseed(os.time())

-- 3. Function to pick & apply a random scheme
local function change_scheme()
  local scheme = schemes[math.random(#schemes)]
  pcall(vim.cmd, "colorscheme " .. scheme)
end

-- 4. Compute seconds until the next 10-minute boundary (e.g. :00, :10, :20, …)
local function schedule_every_10mins()
  local now = os.date("*t")
  -- how many minutes past the hour?
  local past = now.min % 10
  -- secs until the next multiple of 10 minutes
  local delay = ((10 - past) * 60) - now.sec

  -- wait until that boundary
  vim.defer_fn(function()
    change_scheme() -- first flip at the boundary
    -- then every 600000ms (10 minutes)
    vim.fn.timer_start(600000, change_scheme, { ["repeat"] = -1 })
  end, delay * 1000)
end

-- kick it off
schedule_every_10mins()

-- optional: do one immediately on startup
change_scheme()
