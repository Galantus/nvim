-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/none/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/none/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/none/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/none/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/none/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "require('config/plugins/comment')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "require('config/plugins/alpha')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  aurora = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/aurora",
    url = "https://github.com/ray-x/aurora"
  },
  ["bufferline.nvim"] = {
    config = { "require('config/plugins/bufferline')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tabnine"] = {
    config = { "require('config/plugins/cmp_tN')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["code_runner.nvim"] = {
    config = { "require('config/plugins/code_runner')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/code_runner.nvim",
    url = "https://github.com/CRAG666/code_runner.nvim"
  },
  ["focus.nvim"] = {
    config = { "require('config/plugins/windows')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/focus.nvim",
    url = "https://github.com/beauwilliams/focus.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('config/plugins/gitsigns')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "require('config/plugins/hlargs')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('config/plugins/indentline')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-format.nvim"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('config/plugins/lualine')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim",
    url = "https://github.com/christianchiarulli/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    config = { "require('config/plugins/autopairs')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "require('config/plugins/cmp')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('config/plugins/colorizer')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    config = { "require('config/plugins/debug')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "require('config/lsp')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    config = { "require('config/plugins/neoclip')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "require('config/plugins/nvim-tree') " },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('config/plugins/treesitter')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "require('config/plugins/project')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["roshnivim-cs"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/roshnivim-cs",
    url = "https://github.com/shaeinst/roshnivim-cs"
  },
  sniprun = {
    config = { "require('config/plugins/sniprun')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  ["space-nvim"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/space-nvim",
    url = "https://github.com/Th3Whit3Wolf/space-nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "require('config/plugins/spellchecker')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["symbols-outline.nvim"] = {
    config = { "require('config/plugins/outline')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('config/plugins/telescope')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["textobj-diagnostic.nvim"] = {
    config = { "require('config/plugins/diagnostic')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/textobj-diagnostic.nvim",
    url = "https://github.com/andrewferrier/textobj-diagnostic.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "require('config/plugins/toggleterm')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "require('config/plugins/trouble')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vn-night.nvim"] = {
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/vn-night.nvim",
    url = "https://github.com/nxvu699134/vn-night.nvim"
  },
  ["which-key.nvim"] = {
    config = { "require('config/plugins/whichkey')" },
    loaded = true,
    path = "/home/none/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require('config/plugins/trouble')
time([[Config for trouble.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('config/plugins/gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
require('config/plugins/debug')
time([[Config for nvim-dap-ui]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require('config/plugins/alpha')
time([[Config for alpha-nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require('config/plugins/toggleterm')
time([[Config for toggleterm.nvim]], false)
-- Config for: sniprun
time([[Config for sniprun]], true)
require('config/plugins/sniprun')
time([[Config for sniprun]], false)
-- Config for: textobj-diagnostic.nvim
time([[Config for textobj-diagnostic.nvim]], true)
require('config/plugins/diagnostic')
time([[Config for textobj-diagnostic.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('config/lsp')
time([[Config for nvim-lspconfig]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
require('config/plugins/windows')
time([[Config for focus.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('config/plugins/telescope')
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('config/plugins/nvim-tree') 
time([[Config for nvim-tree.lua]], false)
-- Config for: code_runner.nvim
time([[Config for code_runner.nvim]], true)
require('config/plugins/code_runner')
time([[Config for code_runner.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
require('config/plugins/outline')
time([[Config for symbols-outline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('config/plugins/treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: cmp-tabnine
time([[Config for cmp-tabnine]], true)
require('config/plugins/cmp_tN')
time([[Config for cmp-tabnine]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
require('config/plugins/neoclip')
time([[Config for nvim-neoclip.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('config/plugins/cmp')
time([[Config for nvim-cmp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('config/plugins/lualine')
time([[Config for lualine.nvim]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
require('config/plugins/spellchecker')
time([[Config for spellsitter.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require('config/plugins/comment')
time([[Config for Comment.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require('config/plugins/whichkey')
time([[Config for which-key.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('config/plugins/autopairs')
time([[Config for nvim-autopairs]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
require('config/plugins/project')
time([[Config for project.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('config/plugins/indentline')
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require('config/plugins/colorizer')
time([[Config for nvim-colorizer.lua]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
require('config/plugins/hlargs')
time([[Config for hlargs.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
require('config/plugins/bufferline')
time([[Config for bufferline.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
