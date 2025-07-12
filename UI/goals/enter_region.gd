extends Goal


func _parse():
	var region = import_string.get_slice("|", 1)
	_add_icon(bingo_atlas, ENTER_ICON, 1, Color.GREEN)
	_add_text(region)
