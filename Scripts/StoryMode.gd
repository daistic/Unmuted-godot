extends Control

@onready var text_box: TextBox = $MarginContainerTextBox/TextBox
@onready var characters: Control = $Characters

@export var dialog: DialogResource

var dialog_index: int = 0
var can_advance_dialog: bool = true

func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("advance_dialog") &&
	can_advance_dialog &&
	dialog_index < dialog.dialogs.size()):
		_handle_characters_animation()
		_handle_text_box()

func _enter_tree() -> void:
	SignalHub.finished_typing.connect(_on_finished_typing)
	SignalHub.finished_animating.connect(_on_finished_animating)

func _handle_text_box() -> void:
	if text_box.is_typing:
		text_box.finish_typing()
	else:
		text_box.start_typing(dialog.dialogs[dialog_index].line)

func _handle_characters_animation() -> void:
	can_advance_dialog = false
	
	var current_dialog: DialogStruct = dialog.dialogs[dialog_index]
	match current_dialog.animation:
		DialogStruct.animation_event.ENTER:
			_instantiate_character(current_dialog.character)
		_:
			pass

func _instantiate_character(character: PackedScene) -> void:
	var instance: Character = character.instantiate()
	characters.add_child(instance)
	
	instance.play_animation("Enter")

func _on_finished_typing() -> void:
	can_advance_dialog = true
	dialog_index += 1

func _on_finished_animating() -> void:
	can_advance_dialog = true
