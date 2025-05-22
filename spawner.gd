extends Node2D
signal set_chord
@export var chord:Resource
@export var mover:Node2D
@export var timer:Timer
var wait:float =.5
func _on_timer_timeout() -> void:
	var new_chord=chord.instantiate()
	mover.add_child(new_chord)
	new_chord.global_position=global_position
	timer.start(wait)
