extends Control

@onready var text_box: TextBox = $MarginContainerTextBox/TextBox
@onready var characters: Control = $Characters
@onready var input_buffer_timer: Timer = $InputBufferTimer

@export var dialog: DialogResource

var dialog_index: int = 0
var can_advance_dialog: bool = true
var input_allowed: bool = true

func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("advance_dialog") &&
	can_advance_dialog &&
	input_allowed &&
	dialog_index < dialog.dialogs.size()):
		input_allowed = false
		input_buffer_timer.start()
		_handle_characters_animation()
		_handle_text_box()

func _enter_tree() -> void:
	SignalHub.finished_typing.connect(_on_finished_typing)
	SignalHub.finished_animating.connect(_on_finished_animating)

func _handle_text_box() -> void:
	if text_box.is_typing:
		text_box.finish_typing()
	else:
		text_box.start_typing(dialog.dialogs[dialog_index].line, 
		_get_character_name(dialog.dialogs[dialog_index].character))

func _get_character_name(character: PackedScene) -> String:
	var instance: Character = _instantiate_character(character)
	return instance.character_name

func _handle_characters_animation() -> void:
	var current_dialog: DialogStruct = dialog.dialogs[dialog_index]
	
	match current_dialog.animation:
		DialogStruct.animation_event.ENTER:
			can_advance_dialog = false
			_play_character_enter_animation(current_dialog.character)
		_:
			pass

func _instantiate_character(character: PackedScene) -> Character:
	return character.instantiate()

func _play_character_enter_animation(character: PackedScene) -> void:
	var instance: Character = _instantiate_character(character)
	characters.add_child(instance)
	instance.modulate = Color(1, 1, 1, 0)
	instance.play_animation("Enter")

func _on_finished_typing() -> void:
	can_advance_dialog = true
	dialog_index += 1

func _on_finished_animating() -> void:
	can_advance_dialog = true

func _on_input_buffer_timer_timeout() -> void:
	input_allowed = true
