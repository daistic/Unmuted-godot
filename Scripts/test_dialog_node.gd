extends Node2D

@export var lines: DialogResource

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("test_dialog")):
		DialogManager.start_dialog(Vector2(500, 500), lines.lines)
