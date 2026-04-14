if (alive) {
	shader_set(LightMultiply);
	shader_set_uniform_f(AmbientLight.u_color, AmbientLight.r, AmbientLight.g, AmbientLight.b, 1);	
	
	draw_self();
	
	shader_reset();
}