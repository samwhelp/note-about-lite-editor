

/*
* https://github.com/rxi/lite/blob/master/src/api/api.c
* https://github.com/lua/lua/blob/master/lualib.h#L49
* https://github.com/lua/lua/blob/master/linit.c#L57
*/



#include "api.h"


int luaopen_system(lua_State *L);
//int luaopen_renderer(lua_State *L);


static const luaL_Reg libs[] = {
	{ "system",	luaopen_system },
	//{ "renderer",	luaopen_renderer },
	{ NULL, NULL }
};


void api_load_libs(lua_State *L) {
	for (int i = 0; libs[i].name; i++) {
		luaL_requiref(L, libs[i].name, libs[i].func, 1);
	}
}
