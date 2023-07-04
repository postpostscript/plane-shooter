extends Camera2D

@onready var Character = $"../Character"

const ZOOM_MAX: int = 1
const ZOOM_MIN: int = 11
const ZOOM_MIDDLE: int = 6
var ZOOM_LEVEL: int = ZOOM_MIDDLE

func _process(delta):
	var new_position = Character.position
	new_position += get_local_mouse_position() / 2
	position = position + (new_position - position) * min(1, delta * 50)
	
	var zoom_changed = false
	if Input.is_action_just_pressed("zoom_in"):
		ZOOM_LEVEL -= 1
		zoom_changed = true
	if Input.is_action_just_pressed("zoom_out"):
		ZOOM_LEVEL += 1
		zoom_changed = true
	
	if zoom_changed:
		ZOOM_LEVEL = clamp(ZOOM_LEVEL, ZOOM_MAX, ZOOM_MIN)
		zoom = Vector2.ONE / ZOOM_LEVEL * ZOOM_MIDDLE
