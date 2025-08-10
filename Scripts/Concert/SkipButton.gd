extends TextureButton

func _on_pressed() -> void:
	SignalHub.emit_concert_finished()
