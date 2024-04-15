@echo off

set sources=log app gfx glue time audio debugtext shape gl

REM D3D11 Debug
for %%s in (%sources%) do (
    cl /c /D_DEBUG /DIMPL /DSOKOL_D3D11 c\sokol_%%s.c /Z7
    lib /OUT:%%s\sokol_%%s_windows_x64_d3d11_debug.lib sokol_%%s.obj
    del sokol_%%s.obj
)

REM D3D11 Release
for %%s in (%sources%) do (
    cl /c /O2 /DNDEBUG /DIMPL /DSOKOL_D3D11 c\sokol_%%s.c
    lib /OUT:%%s\sokol_%%s_windows_x64_d3d11_release.lib sokol_%%s.obj
    del sokol_%%s.obj
)

REM GL Debug
for %%s in (%sources%) do (
    cl /c /D_DEBUG /DIMPL /DSOKOL_GLCORE33 c\sokol_%%s.c /Z7
    lib /OUT:%%s\sokol_%%s_windows_x64_gl_debug.lib sokol_%%s.obj
    del sokol_%%s.obj
)

REM GL Release
for %%s in (%sources%) do (
    cl /c /O2 /DNDEBUG /DIMPL /DSOKOL_GLCORE33 c\sokol_%%s.c
    lib /OUT:%%s\sokol_%%s_windows_x64_gl_release.lib sokol_%%s.obj
    del sokol_%%s.obj
)

REM GLES Debug
for %%s in (%sources%) do (
    cl /c /I 3rdparty\angle\include /D_DEBUG /DIMPL /DSOKOL_GLES3 c\sokol_%%s.c
    lib /OUT:%%s\sokol_%%s_windows_x64_gles_debug.lib sokol_%%s.obj
    del sokol_%%s.obj
)

REM GLES Release
for %%s in (%sources%) do (
    cl /c /I 3rdparty\angle\include /O2 /DNDEBUG /DIMPL /DSOKOL_GLES3 c\sokol_%%s.c
    lib /OUT:%%s\sokol_%%s_windows_x64_gles_release.lib sokol_%%s.obj
    del sokol_%%s.obj
)

REM D3D11 Debug DLL
cl /D_DEBUG /DIMPL /DSOKOL_DLL /DSOKOL_D3D11 c\sokol.c /Z7 /LDd /MDd /DLL /Fe:sokol_dll_windows_x64_d3d11_debug.dll /link /INCREMENTAL:NO

REM D3D11 Release DLL
cl /D_DEBUG /DIMPL /DSOKOL_DLL /DSOKOL_D3D11 c\sokol.c /LD /MD /DLL /Fe:sokol_dll_windows_x64_d3d11_release.dll /link /INCREMENTAL:NO

REM GL Debug DLL
cl /D_DEBUG /DIMPL /DSOKOL_DLL /DSOKOL_GLCORE33 c\sokol.c /Z7 /LDd /MDd /DLL /Fe:sokol_dll_windows_x64_gl_debug.dll /link /INCREMENTAL:NO

REM GL Release DLL
cl /D_DEBUG /DIMPL /DSOKOL_DLL /DSOKOL_GLCORE33 c\sokol.c /LD /MD /DLL /Fe:sokol_dll_windows_x64_gl_release.dll /link /INCREMENTAL:NO

REM GLES Debug DLL
cl /I 3rdparty\angle\include /D_DEBUG /DIMPL /DSOKOL_DLL /DSOKOL_GLES3 c\sokol.c /Z7 /LDd /MDd /DLL /Fe:sokol_dll_windows_x64_gles_debug.dll /link /LIBPATH:3rdparty\angle\lib libEGL.dll.lib libGLESv2.dll.lib /INCREMENTAL:NO

REM GLES Release DLL
cl /I 3rdparty\angle\include /D_DEBUG /DIMPL /DSOKOL_DLL /DSOKOL_GLES3 c\sokol.c /LD /MD /DLL /Fe:sokol_dll_windows_x64_gles_release.dll /link /LIBPATH:3rdparty\angle\lib libEGL.dll.lib libGLESv2.dll.lib /INCREMENTAL:NO

del sokol.obj