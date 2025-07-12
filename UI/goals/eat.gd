extends Goal


func _parse():
	var split = import_string.split("|")
	var amount = split[1].to_int()
	var food_type = split[5]
	_add_icon(passage_atlas, KARMA_4)
	_add_icon(arena_atlas, food_type)
	_add_text("[0/%d]" % [amount], 2)
