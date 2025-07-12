extends Goal


func _parse():
	var creature_type = import_string.get_slice("|", 1)
	_add_icon(arena_atlas, creature_type)
	_add_icon(bingo_atlas, DEATH_PIT_ICON)
	_add_text("SB_D06", 2)
