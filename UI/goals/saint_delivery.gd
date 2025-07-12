extends Goal


func _parse():
	_add_icon(bingo_atlas, MEMORIES_PEARL)
	_add_icon(bingo_atlas, SINGLE_ARROW)
	_add_icon(bingo_atlas, NOMSC_PEBBLE, 1, Color.MEDIUM_AQUAMARINE)
	auto_place.emit("OtherPOI/Pebbles", self)
