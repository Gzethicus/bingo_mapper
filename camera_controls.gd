extends Camera2D


enum Direction {
	LEFT = 1 << 0,
	UP = 1 << 1,
	RIGHT = 1 << 2,
	DOWN = 1 << 3,
}


const ZOOM_VALUES = [
	Vector2.ONE * pow(2., -3.5),
	Vector2.ONE * pow(2., -3.0),
	Vector2.ONE * pow(2., -2.5),
	Vector2.ONE * pow(2., -2.0),
	Vector2.ONE * pow(2., -1.5),
	Vector2.ONE * pow(2., -1.0),
	Vector2.ONE * pow(2., -0.5),
	Vector2.ONE * pow(2., 0.0),
	Vector2.ONE * pow(2., 0.5),
	Vector2.ONE * pow(2., 1.0),
	Vector2.ONE * pow(2., 1.5),
]


var slide_origin : Vector2

var _zoom_level : int = 0
var zoom_level : int :
	get():
		return _zoom_level
	set(value):
		if value < 0 or value >= ZOOM_VALUES.size():
			return
		_zoom_level = value
		zoom = ZOOM_VALUES[value]
		$UI.scale = Vector2.ONE / ZOOM_VALUES[value]
		for marker in $"../Markers".get_children():
			marker.scale = Vector2.ONE / ZOOM_VALUES[value]
var zoom_value : Vector2 :
	get():
		return ZOOM_VALUES[_zoom_level]

var bounds : Rect2


func _ready() -> void:
	zoom_level = 0


func _process(_delta: float) -> void:
	_mouse_slide_process()
	_zoom_process()
	_bounds_process()


func _mouse_slide_process():
	var mouse_pos = get_local_mouse_position()
	if Input.is_action_just_pressed("pan"):
		slide_origin = mouse_pos
	if Input.is_action_pressed("pan"):
		position += slide_origin - mouse_pos
		slide_origin = mouse_pos


func _zoom_process():
	var mouse_pos = get_local_mouse_position()
	var has_zoom_changed : bool = false
	if Input.is_action_just_pressed("zoom_in"):
		zoom_level += 1
		has_zoom_changed = true
	if Input.is_action_just_pressed("zoom_out"):
		zoom_level -= 1
		has_zoom_changed = true
	if has_zoom_changed:
		position += mouse_pos - get_local_mouse_position()


func _bounds_process():
	var view = Rect2(position, get_viewport_rect().size / ZOOM_VALUES[zoom_level])
	var left_over = bounds.position.x - view.position.x
	var top_over = bounds.position.y - view.position.y
	var right_over = bounds.end.x - view.end.x
	var bottom_over = bounds.end.y - view.end.y
	
	if left_over >= 0. and right_over <= 0.:
		position.x += (left_over + right_over) / 2.
	elif left_over >= 0.:
		position.x += left_over
	elif right_over <= 0.:
		position.x += right_over
	
	if top_over >= 0. and bottom_over <= 0.:
		position.y += (top_over + bottom_over) / 2.
	elif top_over >= 0.:
		position.y += top_over
	elif bottom_over <= 0.:
		position.y += bottom_over
