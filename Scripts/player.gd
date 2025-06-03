extends Area3D

@export var speed: float = 1

@onready var animated_sprite_3d: AnimatedSprite3D = $AnimatedSprite3D

enum {IDLE, WALK}
var animation_state: int = IDLE

func _process(delta: float) -> void:
	_move(delta)
	_animate_sprite()

func _move(delta: float) -> void:
	var move_dir = (Input.get_action_strength("move_right") - 
		Input.get_action_strength("move_left"))
	
	if move_dir > 0:
		animated_sprite_3d.flip_h = true
		animation_state = WALK
	elif move_dir < 0:
		animated_sprite_3d.flip_h = false
		animation_state = WALK
	else:
		animation_state = IDLE
	
	position.x += move_dir * speed * delta

func _animate_sprite() -> void:
	
	match animation_state:
		IDLE:
			animated_sprite_3d.play("Idle")
		WALK:
			animated_sprite_3d.play("Walk")
		_:
			animated_sprite_3d.play("Idle")
