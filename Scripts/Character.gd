extends TextureRect

class_name Character

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var character_name: String = "Nara"

func play_animation(anim_name: String) -> void:
	animation_player.play(anim_name)

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	SignalHub.emit_finished_animating()
