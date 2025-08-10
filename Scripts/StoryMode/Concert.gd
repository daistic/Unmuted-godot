extends Control

func _enter_tree() -> void:
	SignalHub.concert_finished.connect(_go_to_epilogue)

func _go_to_epilogue() -> void:
	Global.change_playing_episode(Global.EPISODE_LIST[Global.EPISODE.EPILOGUE])
	Global.go_to_story_mode()
