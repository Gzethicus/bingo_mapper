extends Goal


func _parse():
	var pearl_from_region = import_string.get_slice("|", 1)
	_add_text(pearl_from_region, 0)
	_add_icon(arena_atlas, PEARL, 0)
	_add_icon(bingo_atlas, SINGLE_ARROW, 1, Color.WHITE, 1)
	_add_icon(bingo_atlas, NOMSC_MOON, 2, Color.GOLDENROD)
