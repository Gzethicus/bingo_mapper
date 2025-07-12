extends Goal


func _parse():
	var split = import_string.split("|")
	var item_to_craft = split[1]
	var amount = split[5].to_int()
	_add_icon(bingo_atlas, CRAFT_ICON)
	_add_icon(arena_atlas, item_to_craft)
	_add_text("[0/%d]" % [amount], 2)
