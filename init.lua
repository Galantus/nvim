-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━❰ Load/Source Configs ❱━━━━━━━━━━━━━ --

-- plugin config to improve start-up time.
-- it should be always on top of init.lua file
 -- impatient needs to be setup before any other lua plugin is loaded so it is recommended you add the following near the start of your
require("config.impatient")    -- Speed up neovim startup time
require("config.options")      -- Options
require("config.keymaps")      -- Mappings
require("config.colorscheme")  -- Colorsheme

-- load/source PLUGINS CONFIGS
require("config.plugins")

-- ━━━━━━━━━━━━━━━━━❰ end of Load ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
