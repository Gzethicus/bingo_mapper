extends Goal


func _parse():
	var split = import_string.split("|")
	var creature_type = split[1]
	var amount = split[5].to_int()
	_add_icon(arena_atlas, creature_type)
	_add_icon(bingo_atlas, SINGLE_ARROW)
	_add_icon(bingo_atlas, GATE)
	_add_text("[0/%d]" % [amount], 2)
