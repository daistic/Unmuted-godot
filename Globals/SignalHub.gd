extends Node

signal finished_typing
signal finished_animating
signal concert_finished

func emit_finished_typing() -> void:
	finished_typing.emit()

func emit_finished_animating() -> void:
	finished_animating.emit()

func emit_concert_finished() -> void:
	concert_finished.emit()
