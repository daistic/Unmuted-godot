extends MarginContainer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $VBoxContainer/Label

func _ready() -> void:
	label.text = Global.playing_episode.episode_name
	animation_player.play("on_ready")
