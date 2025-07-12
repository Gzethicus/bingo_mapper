extends Goal


func _parse():
	var value = import_string.get_slice("|", 1).to_int()
	_add_icon(bingo_atlas, SCAV_MERCHANT)
	_add_text("[0/%d]" % [value], 2)
