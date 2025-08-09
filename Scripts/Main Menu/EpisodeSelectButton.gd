extends TextureButton

@onready var label: Label = $MarginContainer/Label

@export var episode_data: Global.EPISODE

func _ready() -> void:
	pass
	#label.text = Global.EPISODE_LIST[episode_data].episode_name

func _on_pressed() -> void:
	Global.change_playing_episode(Global.EPISODE_LIST[episode_data])
	Global.go_to_story_mode()
