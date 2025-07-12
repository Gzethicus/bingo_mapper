extends Goal


func _parse():
	var amount = import_string.get_slice("|", 1).to_int()
	_add_icon(bingo_atlas, ARTI_MAUL)
	_add_text("[0/%d]" % [amount], 2)
