
/*
* https://github.com/rxi/lite/blob/master/src/api/api.h
*/

#ifndef API_H
#define API_H

#include <stdio.h>

#include "vendor/lua/lua.h"
#include "vendor/lua/lualib.h"
#include "vendor/lua/lauxlib.h"

void api_load_libs(lua_State *L);

#endif
