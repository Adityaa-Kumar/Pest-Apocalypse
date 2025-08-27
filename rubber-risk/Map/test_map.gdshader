shader_type spatial;

uniform sampler2D sand_texture;

void fragment() {
	ALBEDO = mix(texture(sand_texture, UV).rgb, vec3(1.0, 0.0, 0.0), COLOR.b);
}
