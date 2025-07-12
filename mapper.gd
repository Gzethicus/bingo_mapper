extends Node2D


const MARKER_SCENE = preload("res://UI/marker.tscn")
const MAPS = [
	^"Maps/Monk",
	^"Maps/Survivor",
	^"Maps/Hunter",
	^"Maps/Gourmand",
	^"Maps/Artificer",
	^"Maps/Rivulet",
	^"Maps/Spearmaster",
	^"Maps/Saint",
]


var displayed_map


func _ready() -> void:
	if displayed_map == null:
		select_map(0)


func mark_goal(p_position : Vector2) -> void:
	var selected_goal = $Camera2D/UI.board.selected_goal
	if selected_goal == null:
		return
	var new_marker = MARKER_SCENE.instantiate()
	new_marker.goal = selected_goal
	new_marker.scale = Vector2.ONE / $Camera2D.zoom_value
	$Markers.add_child(new_marker)
	new_marker.position = p_position


func mark_preset(position_node : NodePath, goal : Goal):
	if not displayed_map.has_node(position_node):
		printerr("could not find node %s in map %s" % [position_node, displayed_map.name])
		return
	var new_marker = MARKER_SCENE.instantiate()
	new_marker.goal = goal
	new_marker.scale = Vector2.ONE / $Camera2D.zoom_value
	$Markers.add_child(new_marker)
	new_marker.position = displayed_map.get_node(position_node).global_position


func select_map(slugcat_id : int) -> void:
	for child in $Markers.get_children():
		child.queue_free()
	var target_map : TextureRect = get_node(MAPS[slugcat_id])
	if displayed_map != target_map:
		if displayed_map != null:
			displayed_map.hide()
		target_map.show()
		displayed_map = target_map
		Globals.slugcat = slugcat_id as Globals.SlugCat
		$Camera2D.bounds = displayed_map.get_rect()


func _on_maps_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:
			mark_goal(event.position)
