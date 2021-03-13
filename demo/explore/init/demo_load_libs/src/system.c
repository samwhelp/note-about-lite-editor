
/*
* https://github.com/rxi/lite/blob/master/src/api/system.c
*/

#include "api.h"

static int util_x(lua_State *L)
{
	printf("util_x\n");
	return 1;
}

static int util_y(lua_State *L)
{
	printf("util_y\n");
	return 1;
}

static int util_z(lua_State *L)
{
	printf("util_z\n");
	return 1;
}


static const luaL_Reg lib[] = {
	{ "util_x",	util_x },
	{ "util_y",	util_y },
	{ "util_z",	util_z },
	{ NULL,	NULL }
};


int luaopen_system(lua_State *L) {
	luaL_newlib(L, lib);
	return 1;
}
