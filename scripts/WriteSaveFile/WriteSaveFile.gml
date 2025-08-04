/// @func WriteSaveFile()
/// @desc Writes memory-stored save onto a disk, writing separate files for debug and release save

function WriteSaveFile(){
	if (!global.dev_mode) {
		ds_map_secure_save(global.savedata, "save");
	}
	else {
		ds_map_secure_save(global.savedata, "save_dev");
	}
}