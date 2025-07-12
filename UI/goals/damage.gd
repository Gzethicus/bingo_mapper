extends Goal


func _parse():
	var split = import_string.split("|")
	var weapon = split[1]
	var creature = split[5]
	var amount = split[9].to_int()
	var in_one_cycle = split[13] == "true"
	var region = split[17]
	var subregion = split[21]
	if weapon != "Any Weapon":
		_add_icon(arena_atlas, weapon, 0)
	_add_icon(bingo_atlas, BINGO_IMPACT, 0)
	if creature != "Any Creature":
		_add_icon(arena_atlas, creature, 0)
	if subregion != "Any Subregion":
		_add_text(subregion)
	elif region != "Any Region":
		_add_text(region)
	_add_text("[0/%d]" % [amount], 2)
	if in_one_cycle:
		_add_icon(bingo_atlas, CYCLE_LIMIT, 2)
