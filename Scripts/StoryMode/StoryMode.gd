extends Control

@onready var text_box: TextBox = $MarginContainerTextBox/TextBox
@onready var characters: Control = $Characters
@onready var background: TextureRect = $Background
@onready var bgm: AudioStreamPlayer = $BGM

@export var episode: DialogResource

var dialog_index: int = 0
var can_advance_dialog: bool = true

func _enter_tree() -> void:
	SignalHub.finished_typing.connect(_on_finished_typing)

func _ready() -> void:
	#episode = Global.playing_episode
	_advance_dialog()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("advance_dialog"):
		if dialog_index < episode.dialogs.size():
			_advance_dialog()
			_change_something()
		else:
			Global.go_to_main_menu()

func _advance_dialog() -> void:
	if text_box.is_typing == false:
		text_box.start_typing(episode.dialogs[dialog_index].line)
	else:
		text_box.finish_typing()

func _change_something() -> void:
	if dialog_index >= episode.dialogs.size():
		return
	
	var cur_dialog: DialogStruct = episode.dialogs[dialog_index]
	
	if cur_dialog.character_change != null:
		var new_character: Character = cur_dialog.character_change.instantiate()
		
		text_box._change_speaker_label(new_character.character_name)
		
		if !_is_character_already_on_scene(new_character):
			_add_character_to_scene(new_character)
		else:
			new_character.queue_free()
	
	if cur_dialog.background_change != null:
		background.texture = cur_dialog.background_change
	
	if cur_dialog.music_change != null:
		bgm.stream = cur_dialog.music_change
		bgm.play()

func _clear_characters() -> void:
	var old_characters: Array[Node] = characters.get_children()
	for character in old_characters:
		character.queue_free()

func _is_character_already_on_scene(new_character: Character) -> bool:
	for character in characters.get_children():
		if character.scene_file_path == new_character.scene_file_path:
			return true
	
	return false

func _add_character_to_scene(new_character: Character) -> void:
	characters.add_child(new_character)

func _on_finished_typing() -> void:
	dialog_index += 1
