extends MarginContainer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $VBoxContainer/Label

@export var episode_name: String

func _ready() -> void:
	label.text = episode_name
	animation_player.play("on_ready")
