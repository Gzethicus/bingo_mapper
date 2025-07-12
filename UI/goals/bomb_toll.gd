extends Goal


func _parse():
	var split = import_string.split("|")
	var scavenger_toll = split[1].to_upper()
	var pass_the_toll = split[5] == "true"
	_add_icon(arena_atlas, GRENADE)
	_add_icon(bingo_atlas, SCAV_TOLL)
	if pass_the_toll:
		_add_icon(bingo_atlas, SINGLE_ARROW)
	_add_text(scavenger_toll, 2)
	auto_place.emit("Tolls/%s" % [scavenger_toll], self)
