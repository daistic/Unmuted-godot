extends Resource

class_name DialogStruct

@export var character: PackedScene
@export var line: String
@export var animation: animation_event

enum animation_event {
	NONE,
	TRANSITION,
	ENTER,
	EXIT
}
