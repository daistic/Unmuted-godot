extends MarginContainer

@onready var label: Label = $MarginContainer/Label
@onready var timer: Timer = $LetterDisplayTimer

const MAX_WIDTH: int = 256

var text: String = ""
var letter_index: int = 0

var letter_time: float = 0.04

signal finished_displaying

func display_text(text_to_display: String) -> void:
	print(text_to_display)
	text = text_to_display
	label.text = text_to_display
	
	await resized
	custom_minimum_size.x = min(size.x, MAX_WIDTH)
	
	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized # wait for x resize
		await resized # wait for y resize
		custom_minimum_size.y = size.y
	
	global_position.x -= size.x / 2
	global_position.y -= size.y + 24
	
	label.text = ""
	_display_text()
	
func _display_text() -> void:
	label.text += text[letter_index]
	letter_index += 1
	
	if letter_index >= text.length():
		finished_displaying.emit()
		return
	
	match text[letter_index]:
		_:
			timer.start(letter_time)

func _on_letter_display_timer_timeout() -> void:
	_display_text()
