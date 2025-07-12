extends Goal


enum UnlockType {
	ARENA,
	ENTITY,
	CHARACTER,
	SAFARI,
}


const ARENAS = ["CC", "CL", "DM", "DS", "filter", "gutter", "GW", "GWold", "HI", "LC", "LF", "LM", "MS", "OE", "RM", "SB", "SH", "SI", "SL", "SU", "UG", "UW", "VS"]
const CHARACTERS = ["Gourmand", "Artificer", "Spearmaster", "Rivulet", "Saint"]


func _parse():
	var unlock = import_string.get_slice("|", 1)
	var unlock_type : UnlockType
	if unlock in ARENAS:
		unlock_type = UnlockType.ARENA 
	elif unlock in CHARACTERS:
		unlock_type = UnlockType.CHARACTER
	elif unlock.contains("-safari"):
		unlock_type = UnlockType.SAFARI
	else:
		unlock_type = UnlockType.ENTITY
	match unlock_type:
		UnlockType.ARENA:
			_add_icon(bingo_atlas, ARENA_UNLOCK, 1, Color.GOLDENROD)
			_add_text(unlock, 2)
		UnlockType.ENTITY:
			_add_icon(bingo_atlas, ARENA_UNLOCK, 1, Color.DODGER_BLUE)
			_add_icon(arena_atlas, unlock, 2)
		UnlockType.CHARACTER:
			_add_icon(bingo_atlas, ARENA_UNLOCK, 1, Color.LIME_GREEN)
			_add_icon(arena_atlas, unlock, 2)
		UnlockType.SAFARI:
			_add_icon(bingo_atlas, ARENA_UNLOCK, 1, Color.RED)
			_add_text(unlock, 2)
	auto_place.emit("Unlocks/%s" % [unlock], self)
	if unlock == "ScavengerBomb" and Globals.slugcat != Globals.SlugCat.MONK:
		auto_place.emit("Unlocks/ScavengerBomb2", self)
