extends Goal


func _parse():
	var room = import_string.get_slice("|", 1)
	var region = room.substr(0, 2)
	_add_icon(bingo_atlas, VISTA_ICON)
	_add_text(region, 2)
	auto_place.emit("Vistas/%s/0" % [region], self)
	auto_place.emit("Vistas/%s/1" % [region], self)
	auto_place.emit("Vistas/%s/2" % [region], self)
	if Globals.extra_vistas:
		auto_place.emit("Vistas/%s/3" % [region], self)
