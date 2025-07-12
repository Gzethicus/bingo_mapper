extends Goal


func _parse():
	var split = import_string.split("|")
	var creature = split[1]
	var weapon = split[5]
	var amount = split[9].to_int()
	var region = split[13]
	var subregion = split[17]
	var in_one_cycle = split[21] == "true"
	var via_a_death_pit = split[25] == "true"
	var while_starving = split[29] == "true"
	if via_a_death_pit:
		_add_icon(bingo_atlas, DEATH_PIT_ICON, 0)
	elif weapon != "Any Weapon":
		_add_icon(arena_atlas, weapon, 0)
	_add_icon(bingo_atlas, KILL_ICON, 0)
	if creature != "Any Creature":
		_add_icon(arena_atlas, creature, 0)
	if subregion != "Any Subregion":
		_add_text(subregion)
	elif region != "Any Region":
		_add_text(region)
	_add_text("[0/%d]" % [amount], 2)
	if while_starving:
		_add_icon(arena_atlas, DEAD, 2)
	if in_one_cycle:
		_add_icon(bingo_atlas, CYCLE_LIMIT, 2)
