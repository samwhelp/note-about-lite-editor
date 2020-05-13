-- put user settings here
-- this module will be loaded after everything else when the application starts

local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

-- light theme:
-- require "user.colors.summer"
require "user.colors.gruvbox_dark"

-- key binding:
-- keymap.add { ["ctrl+escape"] = "core:quit" }

keymap.add ({

	-- Unbind
	["alt+return"] = "",

	["alt+shift+j"] = "",
	["alt+shift+l"] = "",
	["alt+shift+i"] = "",
	["alt+shift+k"] = "",
	["alt+j"] = "",
	["alt+l"] = "",
	["alt+i"] = "",
	["alt+k"] = "",

	["alt+1"] = "",
	["alt+2"] = "",
	["alt+3"] = "",
	["alt+4"] = "",
	["alt+5"] = "",
	["alt+6"] = "",
	["alt+7"] = "",
	["alt+8"] = "",
	["alt+9"] = "",

	-- New Bind
	["ctrl+escape"] = "core:quit",

	["ctrl+shift+i"] = "root:split-up",
	["ctrl+shift+u"] = "root:split-down",
	["ctrl+shift+y"] = "root:split-left",
	["ctrl+shift+o"] = "root:split-right",

	["alt+shift+i"] = "root:switch-to-up",
	["alt+shift+u"] = "root:switch-to-down",
	["alt+shift+y"] = "root:switch-to-left",
	["alt+shift+o"] = "root:switch-to-right",

}, true)


-- ## Font
-- ### Noto
-- * https://github.com/samwhelp/play-ubuntu-20.04-plan/tree/master/prototype-subject/font-wget/noto
style.font = renderer.font.load("/usr/local/share/fonts/Noto/NotoSansCJKtc-Regular.otf", 14 * SCALE)
style.big_font = renderer.font.load("/usr/local/share/fonts/Noto/NotoSansCJKtc-Regular.otf", 34 * SCALE)
style.code_font = renderer.font.load("/usr/local/share/fonts/Noto/NotoSansMonoCJKtc-Regular.otf", 16 * SCALE)


-- ### CNS11643 / Sung
-- * https://github.com/samwhelp/play-ubuntu-20.04-plan/tree/master/prototype-subject/font-wget/cns11643
--style.font = renderer.font.load("/usr/local/share/fonts/CNS11643/TW-Sung-98_1.ttf", 14 * SCALE)
--style.big_font = renderer.font.load("/usr/local/share/fonts/CNS11643/TW-Sung-98_1.ttf", 34 * SCALE)
--style.code_font = renderer.font.load("/usr/local/share/fonts/CNS11643/TW-Sung-98_1.ttf", 13.5 * SCALE)

-- ### CNS11643 / Kai
--style.font = renderer.font.load("/usr/local/share/fonts/CNS11643/TW-Kai-98_1", 14 * SCALE)
--style.big_font = renderer.font.load("/usr/local/share/fonts/CNS11643/TW-Kai-98_1.ttf", 34 * SCALE)
--style.code_font = renderer.font.load("/usr/local/share/fonts/CNS11643/TW-Kai-98_1.ttf", 13.5 * SCALE)



--config.indent_size = 2
--config.tab_type = "soft"
config.indent_size = 4
config.tab_type = "hard"
