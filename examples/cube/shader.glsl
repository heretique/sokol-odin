@cimport package main
@cimport import sg "../../sokol/gfx"
@cimport import m "../math"

@ctype mat4 m.mat4

@vs vs
uniform vs_params {
    mat4 mvp;
};

in vec4 position;
in vec4 color0;

out vec4 color;

void main() {
    gl_Position = mvp * position;
    color = color0;
}
@end

@fs fs
in vec4 color;
out vec4 frag_color;

void main() {
    frag_color = color;
}
@end

@program cube vs fs
