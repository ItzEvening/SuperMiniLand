shader_set(LightMultiply);
shader_set_uniform_f(AmbientLight.u_color, AmbientLight.r, AmbientLight.g, AmbientLight.b, 1);	

if (draw_path_markers) {
	for (var i = 0; i < array_length(marker_x); i++) {
		draw_sprite(BouncyPathMarkers, -1, marker_x[i], marker_y[i]);
	}	
}

draw_self();
	
shader_reset();