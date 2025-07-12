extends Goal


func _parse():
	var split = import_string.split("|")
	var amount = split[1].to_int()
	var at_once = split[5] == "true"
	_add_icon(arena_atlas, NOODLEFLY_EGG)
	_add_icon(arena_atlas, SMALL_NOODLEFLY)
	if at_once:
		_add_icon(bingo_atlas, CYCLE_LIMIT)
	_add_text("[0/%d]" % [amount], 2)
