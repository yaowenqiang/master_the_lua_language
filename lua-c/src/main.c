#include <stdio.h>
#include "../lib/lua/src/lua.h"
#include "../lib/lua/src/lualib.h"
#include "../lib/lua/src/lauxlib.h"

void lua_example_dofile(void)
{
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);

    if (luaL_dofile(L, "./scripts/factorial.lua") != LUA_OK)
    {
        fprintf(stderr, "Error: %s\n", lua_tostring(L, -1));
        lua_close(L);
    }

    lua_close(L);
}

void lua_example_getvar(void)
{
    lua_State *L = luaL_newstate();
    luaL_dostring(L, "x = 42");
    lua_getglobal(L, "x");
    lua_Number some_var_in_c = lua_tonumber(L, -1);
    printf("some_var_in_c = %d\n", (int)some_var_in_c);
    lua_close(L);
}

void lua_example_stack(void)
{
    lua_State *L = luaL_newstate();
    lua_pushnumber(L, 206); // stack position 1 or stack -3
    lua_pushnumber(L, 306); // stack position 2 or stack -2
    lua_pushnumber(L, 406); // stack position 3 ,or stack -1

    lua_Number element;
    element = lua_tonumber(L, -1);
    printf("The last added element in position 3 of the stack is %d\n", (int)element);

    lua_remove(L, 2); // This should remove 306 from the stack

    element = lua_tonumber(L, 2);
    printf("The element in position 2 of the stack is now %d\n", (int)element);
    lua_close(L);
}
void lua_example_call_lua_function(void)
{
    lua_State *L = luaL_newstate();
    if (luaL_dofile(L, "./scripts/pythagoras.lua") != LUA_OK)
    {
        luaL_error(L, "Error: %s\n", lua_tostring(L, -1));
        lua_close(L);
        return;
    }
    lua_getglobal(L, "pythagoras");
    if (lua_isfunction(L, -1))
    {
        lua_pushnumber(L, 3);
        lua_pushnumber(L, 4);
        const int NUM_ARGS = 2;
        const int NUM_RETURNS = 1;

        if (lua_pcall(L, NUM_ARGS, NUM_RETURNS, 0) != LUA_OK)
        {
            luaL_error(L, "Error: %s\n", lua_tostring(L, -1));
            lua_close(L);
            return;
        }
        lua_Number pythagoras_result = lua_tonumber(L, -1);
        printf("The result of pythagoras(3, 4) is %f\n", (float)pythagoras_result);
    }
    lua_close(L);
}
int native_pythagoras(lua_State *L)
{
    lua_Number b = lua_tonumber(L, -1);
    lua_Number a = lua_tonumber(L, -2);
    lua_Number result = a * a + b * b;
    lua_pushnumber(L, result);
    return 1; // Number of return values
}

void lua_example_call_c_function(void)
{
    lua_State *L = luaL_newstate();

    lua_pushcfunction(L, native_pythagoras);
    lua_setglobal(L, "native_pythagoras");
    luaL_dofile(L, "./scripts/pythagoras_native.lua");
    lua_getglobal(L, "pythagoras");
    if (lua_isfunction(L, -1))
    {
        lua_pushnumber(L, 3);
        lua_pushnumber(L, 4);
        const int NUM_ARGS = 2;
        const int NUM_RETURNS = 1;
        lua_pcall(L, NUM_ARGS, NUM_RETURNS, 0);
        lua_Number pythagoras_result = lua_tonumber(L, -1);
        printf("The result of native pythagoras(3, 4) is %f\n", (float)pythagoras_result);
    }

    lua_close(L);
}

typedef struct rectangle2d
{
    int x;
    int y;
    int width;
    int height;
} rectangle;

int create_rectangle(lua_State *L)
{
    rectangle *rect = (rectangle *)lua_newuserdata(L, sizeof(rectangle));
    rect->x = 0;
    rect->y = 0;
    rect->width = 0;
    rect->height = 0;
    return 1;
}

int change_rectangle_size(lua_State *L)
{
    rectangle *rect = (rectangle *)lua_touserdata(L, -3);
    rect->width = (int)lua_tonumber(L, -2);
    rect->height = (int)lua_tonumber(L, -1);
    return 0;
}

void lua_example_userdata(void)
{
    lua_State *L = luaL_newstate();
    lua_pushcfunction(L, create_rectangle);
    lua_setglobal(L, "crate_rectangle");

    lua_pushcfunction(L, change_rectangle_size);
    lua_setglobal(L, "change_rectangle_size");

    luaL_dofile(L, "./scripts/rectangle.lua");
    lua_getglobal(L, "square");
    if (lua_isuserdata(L, -1))
    {
        rectangle *rect = (rectangle *)lua_touserdata(L, -1);
        printf("We got back a rectangle from lua width %d and height %d\n", rect->width, rect->height);
    }
    else
    {
        printf("We did not get a rectangle userdata from lua\n");
    }
    lua_close(L);
}
void lua_example_table()
{
    lua_State *L = luaL_newstate();
    if (luaL_dofile(L, "./scripts/configtable.lua") == LUA_OK)
    {
        lua_getglobal(L, "config_table");
        if (lua_istable(L, -1))
        {
            lua_getfield(L, -1, "window_width");
            printf("the window width defined in the lua table is %s\n", lua_tostring(L, -1));
        }
    }
    else
    {
        fprintf(stderr, "Error: %s\n", lua_tostring(L, -1));
        lua_close(L);
        return;
    }
    lua_close(L);
}

int main(int argc, char **argv)
{
    // lua_example_dofile();
    // lua_example_getvar();
    // lua_example_stack();
    // lua_example_call_lua_function();
    // lua_example_call_c_function();
    // lua_example_userdata();
    lua_example_table();
    return 0;
}