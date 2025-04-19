shader_type canvas_item;

uniform vec4 colour1 : source_color;
uniform vec4 colour2 : source_color;
uniform vec4 colour3 : source_color;
uniform vec4 colour4 : source_color;

void fragment() {
	vec4 input_color = texture(TEXTURE, UV);
	
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
