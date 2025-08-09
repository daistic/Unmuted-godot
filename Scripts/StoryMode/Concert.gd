extends Control

func _go_to_epilogue() -> void:
	Global.change_playing_episode(Global.EPISODE_LIST[Global.EPISODE.EPILOGUE])
	Global.go_to_story_mode()

func _on_audio_stream_player_finished() -> void:
	_go_to_epilogue()

func _on_texture_button_pressed() -> void:
	_go_to_epilogue()
