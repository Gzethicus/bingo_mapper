extends Goal


const COLORS = {
	&"CC" : Color8(242, 204, 25),
	&"DM" : Color8(246, 238, 83),
	&"DS" : Color8(38, 190, 60),
	&"GW" : Color8(32, 198, 143),
	&"HI" : Color8(34, 91, 255),
	&"LC" : Color8(38, 125, 42),
	&"LC_second" : Color8(194, 102, 0),
	&"LF_bottom" : Color8(255, 60, 60),
	&"LF_west" : Color8(255, 38, 103),
	&"MS" : Color8(215, 232, 97),
	&"OE" : Color8(157, 118, 212),
	&"SB_filtration" : Color8(60, 147, 147),
	&"SB_ravine" : Color8(66, 13, 45),
	&"SH" : Color8(132, 20, 81),
	&"SI_chat3" : Color8(45, 13, 66),
	&"SI_chat4" : Color8(45, 66, 13),
	&"SI_chat5" : Color8(66, 13, 45),
	&"SI_top" : Color8(13, 45, 66),
	&"SI_west" : Color8(13, 66, 45),
	&"SL_bridge" : Color8(148, 53, 237),
	&"SL_chimney" : Color8(255, 27, 180),
	&"SL_moon" : Color8(233, 244, 82),
	&"SU" : Color8(147, 168, 233),
	&"SU_filt" : Color8(255, 201, 233),
	&"UW" : Color8(125, 164, 125),
	&"VS" : Color8(195, 13, 245),
}


func _parse():
	var split = import_string.split("|")
	var specific = split[1] == "true"
	var pearl = split[5]
	var amount = split[9].to_int()
	if specific:
		_add_text(pearl, 0)
		_add_icon(arena_atlas, PEARL_WHITE, 1, COLORS[pearl])
		_add_text("[0/1]", 2)
		auto_place.emit("Pearls/%s" % [pearl], self)
	else:
		_add_icon(bingo_atlas, PEARL_HOARD_COLOR)
		_add_text("[0/%d]" % [amount], 2)
