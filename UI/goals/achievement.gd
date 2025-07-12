extends Goal


func _parse():
	var passage = import_string.get_slice("|", 1)
	_add_icon(bingo_atlas, TINY_CIRCLE)
	_add_icon(passage_atlas, passage_dict[passage])
	_add_icon(bingo_atlas, TINY_CIRCLE)
