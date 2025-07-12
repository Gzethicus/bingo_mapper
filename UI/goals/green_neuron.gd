extends Goal


func _parse():
	var lttm = import_string.get_slice("|", 1) == "true"
	_add_icon(arena_atlas, NEURON_FLY, 1, Color.GREEN)
	_add_icon(bingo_atlas, SINGLE_ARROW)
	if lttm:
		_add_icon(bingo_atlas,NOMSC_MOON,1,Color.GOLDENROD)
		auto_place.emit("OtherPOI/Moon", self)
	else:
		_add_icon(bingo_atlas, NOMSC_PEBBLE, 1, Color.MEDIUM_AQUAMARINE)
		auto_place.emit("OtherPOI/Pebbles", self)
