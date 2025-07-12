extends Goal


func _parse():
	var split = import_string.split("|")
	var common_pearls = split[1] == "true"
	var amount = split[5].to_int()
	var region = split[9]
	_add_icon(bingo_atlas, SHELTER_ICON)
	_add_icon(bingo_atlas, PEARL_HOARD_NORMAL if common_pearls else PEARL_HOARD_COLOR)
	_add_text(region)
	_add_text("[0/%d]" % [amount], 2)
