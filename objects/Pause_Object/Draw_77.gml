//Disable alpha blending (we just want the RGB from screen
gpu_set_blendenable(false);

if (pause) //draw frozen image to screen while paused
{
    surface_set_target(application_surface);
    if (surface_exists(pauseSurf)) draw_surface(pauseSurf,0,0);
    else //restore from buffer if we lost the surface
{
    pauseSurf = surface_create(resW,resH);
    buffer_set_surface(pauseSurfBuffer,pauseSurf,0);
}
surface_reset_target();
}

if (keyboard_check_pressed(vk_escape)) //Toggle Pause
{
    if (!pause) //pause now
    {
        pause = true;
		audio_pause_all();
		audio_play_sound(sfx_Pause, 10,0);
		
		// pause all timers
		PauseTimers(time_source_global);

        //Deactivate everything other than this instance
        instance_deactivate_all(true);

       //NOTE:
        //If you need to pause animation, it must be done separately

        //Capture the game (no GUI)
        pauseSurf = surface_create(resW,resH);
        surface_set_target(pauseSurf);
          draw_surface(application_surface,0,0);
        surface_reset_target();

        //Back up this surface to a buffer Incase we lose it
        if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
        pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
        buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
}
else //unpause now
{
    pause = false;
	audio_resume_all();
	audio_play_sound(sfx_Pause_2,10,0);
    instance_activate_all();
	
	ResumeTimers(time_source_global);
	
    if (surface_exists(pauseSurf)) surface_free(pauseSurf);
    if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
    }
}

//Enable Alpha Blending
gpu_set_blendenable(true);