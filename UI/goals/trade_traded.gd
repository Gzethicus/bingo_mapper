extends Goal


func _parse():
	var amount_of_item = import_string.get_slice("|", 1).to_int()
	_add_icon(bingo_atlas, SCAV_MERCHANT)
	_add_icon(bingo_atlas, SINGLE_ARROW)
	_add_icon(bingo_atlas, SCAV_MERCHANT)
	_add_text("[0/%d]" % [amount_of_item], 2)
