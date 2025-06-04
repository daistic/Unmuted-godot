extends Area3D

@export var lines: DialogResource
@export var text_box_offset: Vector2

@onready var camera: Camera3D = $"../Camera3D"

var dialogueable: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("advance_dialog") and dialogueable:
		_advance_dialogue()

func _ready() -> void:
	dialogueable = false

func _advance_dialogue() -> void:
	if !DialogManager.is_dialog_active:
		var speaker_world_position = global_position
		var text_box_position = camera.unproject_position(speaker_world_position) + text_box_offset
		DialogManager.start_dialog(text_box_position, lines.lines)

func _on_area_entered(area: Area3D) -> void:
	if area is Player:
		dialogueable = true
