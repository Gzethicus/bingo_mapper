extends Goal


func _parse():
	var target_score = import_string.get_slice("|", 1).to_int()
	_add_icon(bingo_atlas, SCORE_ICON)
	_add_icon(bingo_atlas, CYCLE_LIMIT)
	_add_text("[0/%d]" % [target_score], 2)
