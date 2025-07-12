extends Goal


func _parse():
	var amount = import_string.get_slice("|", 1).to_int()
	_add_icon(arena_atlas, NEURON_FLY)
	_add_icon(bingo_atlas, SINGLE_ARROW)
	_add_icon(bingo_atlas, NOMSC_MOON, 1, Color.GOLDENROD)
	_add_text("[0/%d]" % [amount], 2)
