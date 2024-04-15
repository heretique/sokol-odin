

15.04.2024
----------
Added ANGLE prebuilt binaries for Windows
Updated the windows build script accordingly
Modified odin wrapper files to use the ANGLE binaries for GLES gfx platform (This should be done from the bindings generator instead)
Files have to be copied manually to "build" folder 
- sokol_dll_windows_x64_gles_debug.dll
- libEGL.dll
- libGLESv1_CM.dll
- libGLESv2.dll
- d3dcompiler_47.dll

TODO: - examples doesn't work most probably because of shader for gles missing
`VALIDATE_SHADERDESC_SOURCE: shader source code required`