extends Goal


func _parse():
	var split = import_string.split("|")
	var specific_creature = split[1] == "true"
	var creature = split[5]
	var amount = split[9].to_int()
	_add_icon(passage_atlas, THE_FRIEND)
	if specific_creature:
		_add_icon(arena_atlas, creature)
	else:
		_add_text("[0/%d]"%[amount], 2)
