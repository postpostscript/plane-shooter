extends Area2D

@export var SPEED = 3000
@onready var target: Vector2

func _ready():
	look_at(get_global_mouse_position())
	var diff = get_global_mouse_position() - position
	var highest_pos = max(abs(diff.x), abs(diff.y))
	target = position + diff / highest_pos * 100000
	await get_tree().create_timer(2).timeout
	visible = false
	queue_free()

func _process(delta):
	position = position.move_toward(target, delta * SPEED)
