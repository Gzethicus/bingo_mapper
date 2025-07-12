extends Goal


func _parse():
	var amount = import_string.get_slice("|", 1).to_int()
	_add_icon(bingo_atlas, COMPLETE_CHALLENGE)
	_add_text("[0/%d]" % [amount])
	_add_icon(bingo_atlas, FORBIDDEN_ICON, 2, Color.RED)
	_add_icon(arena_atlas, DEAD, 2)
