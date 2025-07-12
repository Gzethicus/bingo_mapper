extends Goal


func _parse():
	var amount = import_string.get_slice("|", 1).to_int()
	_add_icon(passage_atlas, KARMA_4)
	_add_icon(passage_atlas, KARMA_10, 1, Color.GOLDENROD)
	_add_text("[0/%d]" % [amount], 2)
