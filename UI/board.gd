class_name Board
extends GridContainer


signal auto_place(position_node : NodePath, goal : Goal)
signal slugcat_selected(slugcat_id : int)


const GOAL_SCENE = preload("res://UI/goals/goal.tscn")
const SLUGCATS = {
	&"Yellow" : Globals.SlugCat.MONK,
	&"White" : Globals.SlugCat.SURVIVOR,
	&"Red" : Globals.SlugCat.HUNTER,
	&"Gourmand" : Globals.SlugCat.GOURMAND,
	&"Artificer" : Globals.SlugCat.ARTIFICER,
	&"Spear" : Globals.SlugCat.SPEARMASTER,
	&"Rivulet" : Globals.SlugCat.RIVULET,
	&"Saint" : Globals.SlugCat.SAINT,
}
const SCRIPTS = {
	&"BingoNoRegionChallenge" : preload("res://UI/goals/no_region.gd"),
	&"BingoNoNeedleTradingChallenge" : preload("res://UI/goals/no_needle_trading.gd"),
	&"BingoDontUseItemChallenge" : preload("res://UI/goals/dont_use_item.gd"),
	&"BingoTameChallenge" : preload("res://UI/goals/tame.gd"),
	&"BingoBroadcastChallenge" : preload("res://UI/goals/broadcast.gd"),
	&"BingoCollectPearlChallenge" : preload("res://UI/goals/collect_pearl.gd"),
	&"BingoKarmaFlowerChallenge" : preload("res://UI/goals/karma_flower.gd"),
	&"BingoCraftChallenge" : preload("res://UI/goals/craft.gd"),
	&"BingoSaintDeliveryChallenge" : preload("res://UI/goals/saint_delivery.gd"),
	&"BingoPearlDeliveryChallenge" : preload("res://UI/goals/pearl_delivery.gd"),
	&"BingoGreenNeuronChallenge" : preload("res://UI/goals/green_neuron.gd"),
	&"BingoDodgeLeviathanChallenge" : preload("res://UI/goals/dodge_leviathan.gd"),
	&"BingoDepthsChallenge" : preload("res://UI/goals/depths.gd"),
	&"BingoSaintPopcornChallenge" : preload("res://UI/goals/saint_popcorn.gd"),
	&"BingoEatChallenge" : preload("res://UI/goals/eat.gd"),
	&"BingoEnterRegionChallenge" : preload("res://UI/goals/enter_region.gd"),
	&"BingoEnterRegionFromChallenge" : preload("res://UI/goals/enter_region_from.gd"),
	&"BingoAllRegionsExcept" : preload("res://UI/goals/all_regions_except.gd"),
	&"BingoRivCellChallenge" : preload("res://UI/goals/riv_cell.gd"),
	&"BingoUnlockChallenge" : preload("res://UI/goals/unlock.gd"),
	&"BingoNeuronDeliveryChallenge" : preload("res://UI/goals/neuron_delivery.gd"),
	&"BingoHatchNoodleChallenge" : preload("res://UI/goals/hatch_noodle.gd"),
	&"BingoDamageChallenge" : preload("res://UI/goals/damage.gd"),
	&"BingoItemHoardChallenge" : preload("res://UI/goals/item_hoard.gd"),
	&"BingoPearlHoardChallenge" : preload("res://UI/goals/pearl_hoard.gd"),
	&"BingoKillChallenge" : preload("res://UI/goals/kill.gd"),
	&"BingoMaulXChallenge" : preload("res://UI/goals/maul_x.gd"),
	&"BingoMaulTypesChallenge" : preload("res://UI/goals/maul_types.gd"),
	&"BingoMoonCloakChallenge" : preload("res://UI/goals/moon_cloak.gd"),
	&"BingoHellChallenge" : preload("res://UI/goals/hell.gd"),
	&"BingoAchievementChallenge" : preload("res://UI/goals/achievement.gd"),
	&"BingoPinChallenge" : preload("res://UI/goals/pin.gd"),
	&"BingoPopcornChallenge" : preload("res://UI/goals/popcorn.gd"),
	&"BingoCycleScoreChallenge" : preload("res://UI/goals/cycle_score.gd"),
	&"BingoGlobalScoreChallenge" : preload("res://UI/goals/global_score.gd"),
	&"BingoStealChallenge" : preload("res://UI/goals/steal.gd"),
	&"BingoBombTollChallenge" : preload("res://UI/goals/bomb_toll.gd"),
	&"BingoTradeTradedChallenge" : preload("res://UI/goals/trade_traded.gd"),
	&"BingoTradeChallenge" : preload("res://UI/goals/trade.gd"),
	&"BingoTransportChallenge" : preload("res://UI/goals/transport.gd"),
	&"BingoCreatureGateChallenge" : preload("res://UI/goals/creature_gate.gd"),
	&"BingoEchoChallenge" : preload("res://UI/goals/echo.gd"),
	&"BingoVistaChallenge" : preload("res://UI/goals/vista.gd"),
}
const SQUARE_SIZE = Vector2(100, 100)

var _import_string : String
var import_string : String :
	get():
		return _import_string
	set(value):
		_import_string = value
		_parse()
var _selected_goal : Goal
var selected_goal :
	get():
		return _selected_goal
	set(value):
		if _selected_goal != null:
			_selected_goal.select(false)
		_selected_goal = value
		_selected_goal.select(true)
var _shrink_factor : float = 1.
var shrink_factor : float :
	get():
		return _shrink_factor
	set(value):
		for goal in get_children():
			if goal == selected_goal:
				continue
			goal.custom_minimum_size = SQUARE_SIZE * value
		_shrink_factor = value
var current_tween : Tween
var _unkillable = false


func _parse() -> void:
	for goal in get_children():
		goal.queue_free()
	var split = import_string.split(";", true, 2)
	if split[0] not in SLUGCATS.keys():
		return
	slugcat_selected.emit(SLUGCATS[split[0]])
	split = split[1].split("bChG")
	columns = ceili(sqrt(split.size()))
	var n = 0
	for i in range(columns * columns):
		if n < split.size():
			var goal = GOAL_SCENE.instantiate()
			goal.set_script(SCRIPTS[split[n].get_slice("~", 0)])
			goal.import_string = split[n]
			goal.auto_place.connect(_auto_place, ConnectFlags.CONNECT_DEFERRED)
			goal.clicked.connect(func(): selected_goal = goal)
			add_child(goal)
		n += columns
		if n >= columns * columns:
			n -= (columns * columns) - 1
	grow(.5, true)


func shrink(time : float = .8, p_unkillable : bool = false) -> Tween:
	if _unkillable:
		return
	_unkillable = p_unkillable
	if current_tween != null:
		current_tween.kill()
	for goal in get_children():
		goal.clip_contents = true
	current_tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	current_tween.tween_property(self, "shrink_factor", 0., time)
	current_tween.tween_callback(func(): _unkillable = false)
	return current_tween


func grow(time: float = .8, p_unkillable : bool = false) -> Tween:
	if _unkillable:
		return
	_unkillable = p_unkillable
	if current_tween != null:
		current_tween.kill()
	current_tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	current_tween.tween_property(self, "shrink_factor", 1., time)
	current_tween.tween_callback(func():
		if selected_goal != null:
			selected_goal.custom_minimum_size = SQUARE_SIZE
		for goal in get_children():
			goal.clip_contents = false)
	current_tween.tween_callback(func(): _unkillable = false)
	return current_tween


func _auto_place(position_node : NodePath, goal : Goal):
	auto_place.emit(position_node, goal)
