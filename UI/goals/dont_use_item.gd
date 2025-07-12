extends Goal


func _parse():
	var item = import_string.get_slice("|", 1)
	_add_icon(bingo_atlas, FORBIDDEN_ICON, 1, Color.RED)
	_add_icon(arena_atlas, item)
