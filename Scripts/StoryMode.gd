extends Control

@onready var text_box: TextBox = $MarginContainer/TextBox

@export var story_script: DialogResource

var dialog_index: int = -1

func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("advance_dialog") && 
			dialog_index + 2 <= story_script.dialogs.size()):
		if text_box.finished_displaying:
			dialog_index += 1
			text_box.start_display(story_script.dialogs[dialog_index].line)
		else:
			text_box.finish_display()
