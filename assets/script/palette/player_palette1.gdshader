shader_type canvas_item;

uniform vec4 find_colour : source_color;
uniform vec4 target_colour : source_color;

void fragment() {
	vec4 pixel_color = texture(TEXTURE, UV);
	if (length(pixel_color.rgb - find_colour.rgb) < 0.01) {
		
		COLOR = target_colour;
	}
}

