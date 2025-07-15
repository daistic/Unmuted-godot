extends NinePatchRect

class_name TextBox

@onready var line_label: Label = $MarginContainer/LineLabel
@onready var typing_timer: Timer = $TypingTimer

var text: String = ""
var letter_index: int = 0
var finished_displaying: bool = true

func start_display(new_text: String) -> void:
	line_label.text = ""
	text = new_text
	letter_index = 0
	finished_displaying = false
	_display_text()

func _display_text() -> void:
	line_label.text += text[letter_index]
	letter_index += 1
	
	if letter_index >= text.length():
		finish_display()
		return
	
	typing_timer.start()

func finish_display() -> void:
	typing_timer.stop()
	finished_displaying = true
	line_label.text = text

func _on_typing_timer_timeout() -> void:
	_display_text()
