extends Goal


func _parse():
	var split = import_string.split("|")
	var item = split[1]
	var from_scavenger_toll = split[5] == "true"
	var amount = split[9].to_int()
	_add_icon(bingo_atlas, STEAL_ITEM)
	_add_icon(arena_atlas, item)
	if from_scavenger_toll:
		_add_icon(bingo_atlas, SCAV_TOLL)
	else:
		_add_icon(arena_atlas, SCAVENGER)
	_add_text("[0/%d]" % [amount], 2)
