extends Goal


func _parse():
	var split = import_string.split("|")
	var from = split[1]
	var to = split[5]
	_add_text(from, 0)
	_add_icon(bingo_atlas, ENTER_ICON, 1, Color.DODGER_BLUE, 1)
	_add_text(to, 2)
	auto_place.emit("Gates/%s_%s" % [from, to], self)
