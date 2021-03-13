
-- https://github.com/rxi/lite/blob/master/src/main.c#L129
-- https://github.com/rxi/lite/blob/master/data/core/init.lua#L77
-- https://github.com/rxi/lite/blob/master/data/core/init.lua#L451


core = {}

require('system')

function core.init()
	print('core.init')
	system.util_x()
end


function core.run()
	print('core.run')
	system.util_y()
	system.util_z()
end


return core
