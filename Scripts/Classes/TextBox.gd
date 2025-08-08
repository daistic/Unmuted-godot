extends TextureRect

class_name TextBox

@onready var typing_timer: Timer = $TypingTimer
@onready var speaker_label: Label = $MarginContainer/VBoxContainer/SpeakerLabel
@onready var line_label: Label = $MarginContainer/VBoxContainer/LineLabel

var text: String = " "
var letter_index: int = 0
var is_typing: bool = false

func start_typing(new_text: String, new_speaker: String = "") -> void:
	speaker_label.text = new_speaker
	text = new_text
	line_label.text = ""
	letter_index = 0
	is_typing = true
	_type_text()

func _type_text() -> void:
	line_label.text += text[letter_index]
	letter_index += 1
	
	if letter_index >= text.length():
		finish_typing()
	else:
		typing_timer.start()

func finish_typing() -> void:
	line_label.text = text
	is_typing = false
	typing_timer.stop()
	SignalHub.emit_finished_typing()

func _change_speaker_label(speaker_name: String) -> void:
	speaker_label.text = speaker_name

func _on_typing_timer_timeout() -> void:
	_type_text()
