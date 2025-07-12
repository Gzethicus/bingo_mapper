extends Goal


func _parse():
	var deliver = import_string.get_slice("|", 1) == "true"
	_add_icon(arena_atlas, MOON_CLOAK)
	if deliver:
		_add_icon(bingo_atlas, SINGLE_ARROW)
		_add_icon(bingo_atlas, NOMSC_MOON, 1, Color.GOLDENROD)
		auto_place.emit("OtherPOI/Moon", self)
	else:
		auto_place.emit("OtherPOI/MoonCloak", self)
