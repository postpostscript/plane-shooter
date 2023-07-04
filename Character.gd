extends Sprite2D

@export var SPEED = 1000
@onready var bullet_scene = preload("res://bullet.tscn")

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	
	var new_pos = position.move_toward(mouse_pos, delta * SPEED)
	var diff = new_pos - position
	if abs(diff.x) > 1 or abs(diff.y) > 1:
		position = new_pos
		
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		bullet.position = position
		get_parent().call_deferred("add_child", bullet)
