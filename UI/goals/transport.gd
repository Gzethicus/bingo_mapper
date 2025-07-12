extends Goal


func _parse():
	var split = import_string.split("|")
	var from_region = split[1]
	var to_region = split[5]
	var creature_type = split[9]
	_add_icon(arena_atlas, creature_type)
	if from_region != "Any Region":
		_add_text(from_region, 2)
	_add_icon(bingo_atlas, SINGLE_ARROW, 2)
	if to_region != "Any Region":
		_add_text(to_region, 2)
