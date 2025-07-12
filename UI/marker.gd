class_name Marker
extends Node2D


enum MarkerState{
	RETRACTED,
	HIGHLIGHTED,
	DEVELOPPED,
}


const DEFAULT_TOP = Vector2(0., -100.)
const HIGHLIGHT_COLOR = Color.GREEN

var _goal : Goal
var _goal_clone : Goal
var goal : Goal:
	get():
		return _goal
	set(value):
		if _goal_clone != null:
			_goal_clone.queue_free()
		_goal = value
		_goal.add_marker(self)
		var copy = value.duplicate(7)
		copy.state = Goal.GoalState.DEFAULT
		copy.scale = Vector2.ZERO
		copy.custom_minimum_size = Board.SQUARE_SIZE
		copy.select(false)
		copy.mouse_entered.disconnect(copy._on_mouse_entered)
		add_child(copy)
		copy.get_node(^"MarkerCount").queue_free()
		_goal_clone = copy
var state : MarkerState = MarkerState.RETRACTED

var _top : Vector2 = Vector2.ZERO
var top : Vector2:
	get():
		return _top
	set(value):
		_top = value
		$Line2D.points[1] = value
		_goal_clone.position = value - _goal_clone.size.project(Vector2.UP) * _goal_clone.scale / 2.
var _current_tween : Tween


func _process(delta: float) -> void:
	if state == MarkerState.DEVELOPPED:
		var delta_d = (DEFAULT_TOP - top).dot(Vector2.UP)
		top = top.move_toward(DEFAULT_TOP, 3 * delta_d * delta)
	else:
		var delta_d = (Vector2.ZERO - top).dot(Vector2.DOWN)
		top = top.move_toward(Vector2.ZERO, 3 * delta_d * delta)


func develop():
	state = MarkerState.DEVELOPPED
	if _current_tween:
		_current_tween.kill()
	_current_tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_current_tween.tween_property(_goal_clone, ^"scale", Vector2.ONE * .75, 1.)
	_current_tween.parallel().tween_property($Marker, ^"scale", Vector2(0., 1.), 1.)


func retract():
	state = MarkerState.RETRACTED
	if _current_tween:
		_current_tween.kill()
	_current_tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_current_tween.tween_property(_goal_clone, ^"scale", Vector2.ZERO, 1.)
	_current_tween.parallel().tween_property($Marker, ^"scale", Vector2(1., 1.), 1.)


func highlight(on_off : bool):
	state = MarkerState.HIGHLIGHTED if on_off else MarkerState.RETRACTED
	modulate = HIGHLIGHT_COLOR if on_off else Color.WHITE


func delete():
	if _goal != null:
		_goal.remove_marker(self)
	queue_free()


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed == true:
			delete()
