extends Goal


func _parse():
	var split = import_string.split("|")
	var region = split[1]
	var amount = split[split.find("Amount") - 1].to_int()
	_add_icon(passage_atlas, THE_WANDERER)
	_add_icon(bingo_atlas, FORBIDDEN_ICON, 1, Color.RED)
	_add_text(region)
	_add_text("[0/%d]" % [amount], 2)
