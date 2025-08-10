extends AudioStreamPlayer

func _on_finished() -> void:
	SignalHub.emit_concert_finished()
