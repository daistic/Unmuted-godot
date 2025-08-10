extends Control

@export var next_episode: Global.EPISODE

func _enter_tree() -> void:
	SignalHub.concert_finished.connect(_go_to_epilogue)

func _go_to_epilogue() -> void:
	Global._export_error(next_episode)
