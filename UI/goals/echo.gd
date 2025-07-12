extends Goal


func _parse():
	var split = import_string.split("|")
	var region = split[1]
	var while_starving = split[5] == "true"
	_add_icon(bingo_atlas, ECHO_ICON)
	_add_text(region)
	if while_starving:
		_add_icon(arena_atlas, DEAD, 2)
	auto_place.emit("Echos/%s" % [region], self)
