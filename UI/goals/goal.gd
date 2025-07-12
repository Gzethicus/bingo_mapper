class_name Goal
extends Control


signal auto_place(position_node : NodePath, goal : Goal)
signal clicked


enum GoalState{
	UNINITIALIZED,
	DEFAULT,
	HOVERED,
	SELECTED,
}


#region bingo_atlas_coordinates
const ARENA_UNLOCK = Rect2(0, 50, 23, 23)
const ARTI_MAUL = Rect2(0, 101, 29, 29)
const ARTI_MAUL_ANY = Rect2(32, 221, 29, 34)
const ARTI_MAUL_CRIT = Rect2(0, 255, 29, 34)
const BINGO_IMPACT = Rect2(31, 30, 20, 20)
const BINGO_LOCK = Rect2(0, 362, 40, 40)
const BROADCAST = Rect2(47, 50, 13, 13)
const COMMERCE = Rect2(24, 0, 13, 12)
const COMPLETE_CHALLENGE = Rect2(23, 50, 24, 25)
const CRAFT_ICON = Rect2(37, 0, 26, 13)
const CYCLE_LIMIT = Rect2(0, 75, 26, 26)
const DEATH_PIT_ICON = Rect2(0, 189, 32, 32)
const DOUBLE_SHELTER = Rect2(0, 473, 24, 28)
const ECHO_ICON = Rect2(43, 323, 17, 39)
const ENTER_ICON = Rect2(40, 427, 20, 20)
const FORBIDDEN_ICON = Rect2(40, 407, 20, 20)
const GATE = Rect2(49, 255, 14, 14)
const GOURM_CRAFT = Rect2(32, 189, 26, 32)
const KILL_ICON = Rect2(40, 447, 20, 20)
const LEVIATHAN_DODGE = Rect2(0, 407, 40, 66)
const MEMORIES_PEARL = Rect2(0, 30, 10, 19)
const NO_MERCHANT = Rect2(29, 255, 20, 34)
const NOMSC_PEBBLE = Rect2(11, 30, 19, 19)
const NOMSC_MOON = Rect2(29, 101, 21, 19)
const PEARL_HOARD_COLOR = Rect2(29, 13, 17, 17)
const PEARL_HOARD_NORMAL = Rect2(46, 13, 17, 17)
const PIN_CREATURE = Rect2(26, 75, 25, 26)
const PIPIS = Rect2(0, 130, 46, 29)
const POPCORN_PLANT = Rect2(40, 362, 17, 45)
const SCAV_MERCHANT = Rect2(0, 289, 20, 34)
const SCAV_TOLL = Rect2(0, 323, 43, 36)
const SCORE_ICON = Rect2(25, 159, 26, 26)
const SHELTER_ICON = Rect2(46, 130, 14, 16)
const SINGLE_ARROW = Rect2(14, 13, 15, 16)
const SPEAR_NEEDLE = Rect2(20, 289, 18, 34)
const STEAL_ITEM = Rect2(0, 159, 25, 29)
const TINY_CHECK = Rect2(0, 0, 8, 8)
const TINY_CIRCLE = Rect2(51, 30, 8, 8)
const TINY_CROWN = Rect2(8, 0, 8, 8)
const TINY_DICE = Rect2(0, 13, 14, 14)
const TINY_X = Rect2(16, 0, 8, 8)
const VISTA_ICON = Rect2(0, 221, 32, 32)
const YES_MERCHANT = Rect2(38, 289, 20, 34)
#endregion

#region arena_atlas_coordinates
const ROCK = Rect2(0, 0, 16, 12)
const SPEAR = Rect2(0, 12, 20, 36)
const EXPLOSIVE_SPEAR = Rect2(0, 48, 20, 36)
const ELECTRIC_SPEAR = Rect2(0, 84, 20, 36)
const FIRE_SPEAR = Rect2(0, 120, 21, 38)
const LILLYPUCK = Rect2(0, 158, 24, 22)
const PEARL = Rect2(0, 180, 11, 11)
const PEARL_WHITE = Rect2(0, 191, 11, 11)
const GRENADE = Rect2(0, 202, 17, 17)
const SINGULARITY_BOMB = Rect2(0, 219, 16, 17)
const FIRE_EGG = Rect2(0, 236, 18, 18)
const BEEHIVE = Rect2(24, 0, 23, 23)
const LANTERN = Rect2(24, 23, 15, 17)
const VULTURE_MASK = Rect2(24, 40, 19, 23)
const BATNIP = Rect2(24, 63, 22, 28)
const MUSHROOM = Rect2(24, 91, 12, 19)
const FLASHBANG = Rect2(24, 110, 14, 17)
const SPORE_PUFF = Rect2(24, 127, 21, 26)
const GOOIEDUCK = Rect2(24, 153, 18, 20)
const BUBBLE_FRUIT = Rect2(24, 173, 13, 13)
const DANDELION_PEACH = Rect2(24, 186, 16, 23)
const CHERRYBOMB = Rect2(24, 209, 20, 29)
const BLUE_FRUIT = Rect2(47, 0, 15, 22)
const JELLYFISH = Rect2(47, 22, 22, 24)
const BUBBLE_WEED = Rect2(47, 46, 20, 26)
const GLOW_WEED = Rect2(47, 72, 18, 21)
const SLIME_MOLD = Rect2(47, 93, 24, 23)
const RAREFACTION_CELL = Rect2(47, 116, 20, 20)
const JOKE_RIFLE = Rect2(47, 136, 23, 35)
const NEURON_FLY = Rect2(47, 171, 11, 26)
const EGGBUG_EGG = Rect2(47, 197, 15, 19)
const SEED = Rect2(47, 216, 10, 10)
const NOODLEFLY_EGG = Rect2(47, 226, 16, 21)
const SLUGCAT = Rect2(71, 0, 20, 19)
const GREEN_LIZARD = Rect2(71, 19, 28, 18)
const PINK_LIZARD = Rect2(71, 37, 28, 18)
const BLUE_LIZARD = Rect2(71, 55, 28, 18)
const WHITE_LIZARD = Rect2(71, 73, 28, 18)
const MOLE_LIZARD = Rect2(71, 91, 29, 18)
const YELLOW_LIZARD = Rect2(71, 109, 30, 18)
const CARAMEL_LIZARD = Rect2(71, 127, 28, 20)
const STRAWBERRY_LIZARD = Rect2(71, 147, 28, 18)
const CYAN_LIZARD = Rect2(71, 165, 28, 18)
const RED_LIZARD = Rect2(71, 183, 28, 18)
const SALAMANDER = Rect2(71, 201, 29, 18)
const EEL_LIZARD = Rect2(71, 219, 29, 18)
const BATFLY = Rect2(71, 237, 33, 17)
const BLACK_SQUIDCADA = Rect2(104, 0, 21, 21)
const WHITE_SQUIDCADA = Rect2(104, 21, 21, 21)
const SNAIL = Rect2(104, 42, 21, 22)
const RED_LEECH = Rect2(104, 64, 16, 17)
const SEA_LEECH = Rect2(104, 81, 16, 17)
const JUNGLE_LEECH = Rect2(104, 98, 16, 17)
const POLE_PLANT = Rect2(104, 115, 24, 19)
const MONSTER_KELP = Rect2(104, 134, 29, 18)
const SCAVENGER = Rect2(104, 152, 22, 23)
const ELITE_SCAVENGER = Rect2(104, 175, 31, 32)
const VULTURE_GRUB = Rect2(104, 207, 20, 17)
const VULTURE = Rect2(104, 224, 19, 23)
const KING_VULTURE = Rect2(135, 0, 29, 29)
const SMALL_CENTIPEDE = Rect2(135, 29, 23, 21)
const CENTIPEDE = Rect2(135, 50, 27, 22)
const BIG_CENTIPEDE = Rect2(135, 72, 31, 23)
const RED_CENTIPEDE = Rect2(135, 95, 31, 23)
const CENTIWING = Rect2(135, 118, 31, 23)
const AQUAPEDE = Rect2(135, 141, 31, 23)
const GRAPPLE_WORM = Rect2(135, 164, 20, 20)
const HAZER = Rect2(135, 184, 15, 22)
const LANTERN_MOUSE = Rect2(135, 206, 19, 17)
const COALESCIPEDE = Rect2(135, 223, 26, 17)
const BIG_SPIDER = Rect2(166, 0, 29, 20)
const SPITTER_SPIDER = Rect2(166, 20, 29, 20)
const MOTHER_SPIDER = Rect2(166, 40, 29, 20)
const MIROS_BIRD = Rect2(166, 60, 41, 20)
const MIROS_VULTURE = Rect2(166, 80, 41, 20)
const BROTHER_LONG_LEG = Rect2(166, 100, 30, 25)
const DADDY_LONG_LEG = Rect2(166, 125, 30, 25)
const MOTHER_LONG_LEG = Rect2(166, 150, 30, 25)
const INSPECTOR = Rect2(166, 175, 18, 25)
const RAIN_DEER = Rect2(166, 200, 37, 35)
const EGGBUG = Rect2(207, 0, 28, 22)
const FIREBUG = Rect2(207, 22, 28, 22)
const DROPWIG = Rect2(207, 44, 31, 22)
const SLUGPUP = Rect2(207, 66, 12, 12)
const NOODLEFLY = Rect2(207, 78, 14, 25)
const SMALL_NOODLEFLY = Rect2(207, 103, 12, 19)
const JETFISH = Rect2(207, 122, 21, 21)
const YEEK = Rect2(207, 143, 20, 20)
const LEVIATHAN = Rect2(207, 163, 33, 28)
const GIANT_JELLYFISH = Rect2(207, 191, 22, 23)
const MONK = Rect2(240, 0, 20, 19)
const SURVIVOR = Rect2(240, 19, 20, 19)
const HUNTER = Rect2(240, 38, 20, 19)
const GOURMAND = Rect2(240, 57, 20, 20)
const ARTIFICER = Rect2(240, 77, 20, 19)
const SPEARMASTER = Rect2(240, 96, 20, 24)
const RIVULET = Rect2(240, 120, 24, 19)
const SAINT = Rect2(240, 139, 20, 19)
const DEAD = Rect2(240, 158, 20, 19)
const MOON_CLOAK = Rect2(241, 177, 21, 25)
#endregion

#region passage_atlas_coordinates
const THE_SURVIVOR = Rect2(0, 0, 32, 32)
const THE_MONK = Rect2(0, 32, 32, 32)
const THE_HUNTER = Rect2(0, 64, 32, 32)
const THE_SAINT = Rect2(0, 96, 32, 32)
const THE_OUTLAW = Rect2(32, 0, 32, 32)
const THE_CHIEFTAIN = Rect2(32, 32, 32, 32)
const THE_WANDERER = Rect2(32, 64, 32, 32)
const THE_DRAGON_SLAYER = Rect2(32, 96, 32, 32)
const THE_FRIEND = Rect2(64, 0, 32, 32)
const THE_SCHOLAR = Rect2(64, 32, 32, 32)
const THE_MARTYR = Rect2(64, 64, 32, 32)
const THE_NOMAD = Rect2(64, 96, 32, 32)
const THE_PILGRIM = Rect2(96, 0, 32, 32)
const KARMA_3 = Rect2(96, 32, 32, 32)
const KARMA_4 = Rect2(96, 64, 32, 32)
const KARMA_10 = Rect2(96, 96, 32, 32)
#endregion


const entity_dict = {
	&"Rock" : ROCK,
	&"Spear" : SPEAR,
	&"ExplosiveSpear" : EXPLOSIVE_SPEAR,
	&"ElectricSpear" : ELECTRIC_SPEAR,
	&"FireSpear" : FIRE_SPEAR,
	&"LillyPuck" : LILLYPUCK,
	&"DataPearl" : PEARL,
	&"ScavengerBomb" : GRENADE,
	&"SingularityBomb" : SINGULARITY_BOMB,
	&"FireEgg" : FIRE_EGG,
	&"SporePlant" : BEEHIVE,
	&"Lantern" : LANTERN,
	&"VultureMask" : VULTURE_MASK,
	&"FlyLure" : BATNIP,
	&"Mushroom" : MUSHROOM,
	&"FlareBomb" : FLASHBANG,
	&"PuffBall" : SPORE_PUFF,
	&"GooieDuck" : GOOIEDUCK,
	&"WaterNut" : BUBBLE_FRUIT,
	&"DandelionPeach" : DANDELION_PEACH,
	&"FirecrackerPlant" : CHERRYBOMB,
	&"DangleFruit" : BLUE_FRUIT,
	&"JellyFish" : JELLYFISH,
	&"BubbleGrass" : BUBBLE_WEED,
	&"GlowWeed" : GLOW_WEED,
	&"SlimeMold" : SLIME_MOLD,
	&"EnergyCell" : RAREFACTION_CELL,
	&"JokeRifle" : JOKE_RIFLE,
	&"SSOracleSwarmer" : NEURON_FLY,
	&"EggBugEgg" : EGGBUG_EGG,
	&"Seed" : SEED,
	&"NeedleEgg" : NOODLEFLY_EGG,
	&"SlugCat" : SLUGCAT,
	&"GreenLizard" : GREEN_LIZARD,
	&"PinkLizard" : PINK_LIZARD,
	&"BlueLizard" : BLUE_LIZARD,
	&"WhiteLizard" : WHITE_LIZARD,
	&"BlackLizard" : MOLE_LIZARD,
	&"YellowLizard" : YELLOW_LIZARD,
	&"SpitLizard" : CARAMEL_LIZARD,
	&"ZoopLizard" : STRAWBERRY_LIZARD,
	&"CyanLizard" : CYAN_LIZARD,
	&"RedLizard" : RED_LIZARD,
	&"Salamander" : SALAMANDER,
	&"EelLizard" : EEL_LIZARD,
	&"Fly" : BATFLY,
	&"CicadaB" : BLACK_SQUIDCADA,
	&"CicadaA" : WHITE_SQUIDCADA,
	&"Snail" : SNAIL,
	&"Leech" : RED_LEECH,
	&"SeaLeech" : SEA_LEECH,
	&"JungleLeech" : JUNGLE_LEECH,
	&"PoleMimic" : POLE_PLANT,
	&"TentaclePlant" : MONSTER_KELP,
	&"Scavenger" : SCAVENGER,
	&"ScavengerElite" : ELITE_SCAVENGER,
	&"VultureGrub" : VULTURE_GRUB,
	&"Vulture" : VULTURE,
	&"KingVulture" : KING_VULTURE,
	&"SmallCentipede" : SMALL_CENTIPEDE,
	&"Centipede" : CENTIPEDE,
	&"BigCentipede" : BIG_CENTIPEDE,
	&"RedCentipede" : RED_CENTIPEDE,
	&"Centiwing" : CENTIWING,
	&"AquaCenti" : AQUAPEDE,
	&"TubeWorm" : GRAPPLE_WORM,
	&"Hazer" : HAZER,
	&"LanternMouse" : LANTERN_MOUSE,
	&"Spider" : COALESCIPEDE,
	&"BigSpider" : BIG_SPIDER,
	&"SpitterSpider" : SPITTER_SPIDER,
	&"MotherSpider" : MOTHER_SPIDER,
	&"MirosBird" : MIROS_BIRD,
	&"MirosVulture" : MIROS_VULTURE,
	&"BrotherLongLegs" : BROTHER_LONG_LEG,
	&"DaddyLongLegs" : DADDY_LONG_LEG,
	&"TerrorLongLegs" : MOTHER_LONG_LEG,
	&"Inspector" : INSPECTOR,
	&"Deer" : RAIN_DEER,
	&"EggBug" : EGGBUG,
	&"FireBug" : FIREBUG,
	&"DropBug" : DROPWIG,
	&"SlugNPC" : SLUGPUP,
	&"BigNeedleWorm" : NOODLEFLY,
	&"SmallNeedleWorm" : SMALL_NOODLEFLY,
	&"JetFish" : JETFISH,
	&"Yeek" : YEEK,
	&"Leviathan" : LEVIATHAN,
	&"BigJelly" : GIANT_JELLYFISH,
	&"Monk" : MONK,
	&"Survivor" : SURVIVOR,
	&"Hunter" : HUNTER,
	&"Gourmand" : GOURMAND,
	&"Artificer" : ARTIFICER,
	&"Spearmaster" : SPEARMASTER,
	&"Rivulet" : RIVULET,
	&"Saint" : SAINT,
}
const passage_dict ={
	&"Survivor" : THE_SURVIVOR,
	&"Monk" : THE_MONK,
	&"Hunter" : THE_HUNTER,
	&"Saint" : THE_SAINT,
	&"Outlaw" : THE_OUTLAW,
	&"Chieftain" : THE_CHIEFTAIN,
	&"Traveller" : THE_WANDERER,
	&"DragonSlayer" : THE_DRAGON_SLAYER,
	&"Friend" : THE_FRIEND,
	&"Scholar" : THE_SCHOLAR,
	&"Martyr" : THE_MARTYR,
	&"Nomad" : THE_NOMAD,
	&"Pilgrim" : THE_PILGRIM,
}
const DEFAULT_STYLE = preload("res://UI/goals/goal_style_default.tres")
const HOVERED_STYLE = preload("res://UI/goals/goal_style_hovered.tres")
const SELECTED_STYLE = preload("res://UI/goals/goal_style_selected.tres")

var bingo_atlas : Texture2D = preload("res://graphics/bingoicons.png")
var arena_atlas : Texture2D = preload("res://graphics/arenaicons.png")
var passage_atlas : Texture2D = preload("res://graphics/passageicons.png")


var import_string : String
var state : GoalState = GoalState.UNINITIALIZED
var _markers : Array[Marker] = []


@onready var lines = [
	$"MarginContainer/VBoxContainer/Line 0",
	$"MarginContainer/VBoxContainer/Line 1",
	$"MarginContainer/VBoxContainer/Line 2",
]


func _ready() -> void:
	if state == GoalState.UNINITIALIZED:
		_parse()
	state = GoalState.DEFAULT


func add_marker(marker : Marker) -> void:
	_markers.append(marker)
	$MarkerCount.text = String.num_int64(_markers.size())


func remove_marker(marker : Marker) -> void:
	_markers.erase(marker)
	$MarkerCount.text = String.num_int64(_markers.size())


func select(selecting : bool) -> void:
	state = GoalState.SELECTED if selecting else GoalState.DEFAULT
	_set_style(SELECTED_STYLE if selecting else DEFAULT_STYLE)


func _add_icon(atlas : Texture2D, region, to_line : int = 1, modulation : Color = Color.WHITE, rotate : int = 0) -> void:
	if region is String or region is StringName:
		region = entity_dict[StringName(region)]
	region.position += Vector2.ONE * 0.01
	var texture_rect = TextureRect.new()
	lines[to_line].add_child(texture_rect)
	texture_rect.texture = AtlasTexture.new()
	texture_rect.texture.atlas = atlas
	texture_rect.texture.region = region
	texture_rect.modulate = modulation
	if rotate % 4 != 0:
		var rotated_image : Image = texture_rect.texture.get_image()
		match rotate % 4:
			1: rotated_image.rotate_90(CLOCKWISE)
			2: rotated_image.rotate_180()
			3: rotated_image.rotate_90(COUNTERCLOCKWISE)
		texture_rect.texture = ImageTexture.create_from_image(rotated_image)
	texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
	texture_rect.size_flags_horizontal = Control.SIZE_EXPAND_FILL


func _add_text(text : String, to_line : int = 1) -> void:
	var label = Label.new()
	lines[to_line].add_child(label)
	label.text = text
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL


func _parse() -> void:
	pass


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:
			clicked.emit()


func _set_style(style : StyleBox):
	$Panel.remove_theme_stylebox_override("panel")
	$Panel.add_theme_stylebox_override("panel", style)


func _on_mouse_entered() -> void:
	if state == GoalState.DEFAULT:
		_set_style(HOVERED_STYLE)
		state = GoalState.HOVERED
	for marker in _markers:
		marker.highlight(true)


func _on_mouse_exited() -> void:
	if state == GoalState.HOVERED:
		_set_style(DEFAULT_STYLE)
		state = GoalState.DEFAULT
	for marker in _markers:
		marker.highlight(false)
