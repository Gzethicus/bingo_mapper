extends Goal


func _parse():
	var amount = import_string.get_slice("|", 1).to_int()
	_add_icon(arena_atlas, SPEAR)
	_add_icon(bingo_atlas, POPCORN_PLANT, 1, Color.WEB_MAROON)
	_add_text("[0/%d]" % [amount], 2)
