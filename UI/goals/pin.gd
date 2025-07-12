extends Goal


func _parse():
	var split = import_string.split("|")
	var amount = split[1].to_int()
	var creature_type = split[5]
	var region = split[9]
	_add_icon(bingo_atlas, PIN_CREATURE)
	if creature_type != "Any Creature":
		_add_icon(arena_atlas, creature_type)
	if region == "Any Region":
		_add_icon(passage_atlas, THE_WANDERER)
	else:
		_add_text(region)
	_add_text("[0/%d]" % [amount], 2)
