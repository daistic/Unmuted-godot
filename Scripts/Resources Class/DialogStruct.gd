extends Resource

class_name DialogStruct

@export var speaker: PackedScene
@export var line: String
@export var event: dialog_event

enum dialog_event{
	NONE,
	ENTER,
	EXIT
}
