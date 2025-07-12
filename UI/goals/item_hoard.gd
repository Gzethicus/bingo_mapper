extends Goal


func _parse():
	var split = import_string.split("|")
	var any_shelter = split[1] == "true"
	var amount = split[5].to_int()
	var item = split[9]
	if any_shelter:
		_add_icon(bingo_atlas, DOUBLE_SHELTER)
	else:
		_add_icon(bingo_atlas, SHELTER_ICON)
	_add_icon(arena_atlas, item)
	_add_text("[0/%d]" % [amount], 2)
