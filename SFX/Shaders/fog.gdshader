shader_type canvas_item;

uniform sampler2D smoke_texture;
uniform float alpha : hint_range(0, 1) = 0.5;
uniform vec2 velocity = vec2(0.1, 0.1);  // Controls the speed and direction of the movement

void fragment() {
    vec2 tex_coords = fract(SCREEN_UV + velocity * TIME);  // Wrap texture coordinates
    vec4 smoke_color = texture(smoke_texture, tex_coords);
    smoke_color.a *= alpha;
    COLOR = mix(COLOR, smoke_color, smoke_color.a);
}
