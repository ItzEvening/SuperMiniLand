
if (!fired) {
	global.lo.send(signal, data);
	fired = true;
	time_source_start(reset_timer);
}