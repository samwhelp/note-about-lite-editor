
/*

* https://www.lagagain.com/post/30%E5%A4%A9lua%E9%87%8D%E6%8B%BE%E7%AD%86%E8%A8%9830%E8%88%87c%E4%BA%A4%E4%BA%92/

*/


#include <stdio.h>
#include "vendor/lua/lua.h"
#include "vendor/lua/lualib.h"
#include "vendor/lua/lauxlib.h"

int main(int argc, char** argv)
{

	// new a lua VM
	lua_State *L = luaL_newstate();

	// open all libraries
	luaL_openlibs(L);

	// dofile
	luaL_dofile(L, "hello.lua");


	lua_close(L);

	return 0;
}
