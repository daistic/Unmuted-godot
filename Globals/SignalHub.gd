extends Node

signal finished_typing
signal finished_animating

func emit_finished_typing() -> void:
	finished_typing.emit()

func emit_finished_animating() -> void:
	finished_animating.emit()
