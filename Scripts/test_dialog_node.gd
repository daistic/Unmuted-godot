extends Node2D

@export var lines: Array[String] = []

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("test_dialog")):
		DialogManager.start_dialog(Vector2(100, 100), lines)
