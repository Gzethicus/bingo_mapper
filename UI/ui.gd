extends Control


signal auto_place(position_node : NodePath, goal : Goal)
signal slugcat_selected(slugcat_id : int)


var is_board_pinned : bool = false


@onready var board = $VBoxContainer/Board


func _process(_delta: float) -> void:
	size = get_viewport_rect().size


func import_board():
	var tween : Tween = board.shrink(.3, true)
	if tween != null:
		tween.tween_callback(func(): board.import_string = DisplayServer.clipboard_get())


func pin(on_off : bool) -> void:
	is_board_pinned = on_off


func _select_slugcat(id : int) -> void:
	slugcat_selected.emit(id)


func _on_v_box_container_mouse_entered() -> void:
	if not is_board_pinned:
		board.grow()


func _on_v_box_container_mouse_exited() -> void:
	if not is_board_pinned:
		board.shrink()


func _auto_place(position_node : NodePath, goal : Goal):
	auto_place.emit(position_node, goal)


func _on_extra_vistas_button_toggled(toggled_on: bool) -> void:
	Globals.extra_vistas = toggled_on
