
/*

* https://github.com/rxi/lite/blob/master/src/main.c

*/


#include <stdio.h>
#include <unistd.h>
#include <string.h>

#include "vendor/lua/lua.h"
#include "vendor/lua/lualib.h"
#include "vendor/lua/lauxlib.h"


static void get_exe_filename(char *buf, int sz)
{

	char path[512];
	sprintf(path, "/proc/%d/exe", getpid());
	int len = readlink(path, buf, sz - 1);
	buf[len] = '\0';

}


int main(int argc, char** argv)
{


	lua_State *L = luaL_newstate();

	// open all libraries
	luaL_openlibs(L);


	char exename[2048];
	get_exe_filename(exename, sizeof(exename));
	printf("main.c => EXEFILE: %s\n", exename);
	lua_pushstring(L, exename);
	lua_setglobal(L, "EXEFILE");


	(void) luaL_dostring(L,
		"local core\n"
		"xpcall(function()\n"
		"	SCALE = tonumber(os.getenv(\"LITE_SCALE\")) or SCALE\n"
		"	PATHSEP = package.config:sub(1, 1)\n"
		"	EXEDIR = EXEFILE:match(\"^(.+)[/\\\\].*$\")\n"
		"	package.path = EXEDIR .. '/data/?.lua;' .. package.path\n"
		"	package.path = EXEDIR .. '/data/?/init.lua;' .. package.path\n"
		"	core = require('core')\n"
		"	core.init()\n"
		"	core.run()\n"
		"end, function(err)\n"
		"	print('Error: ' .. tostring(err))\n"
		"	print(debug.traceback(nil, 2))\n"
		"	if core and core.on_error then\n"
		"		pcall(core.on_error, err)\n"
		"	end\n"
		"	os.exit(1)\n"
		"end)");




	lua_close(L);

	return 0;
}
