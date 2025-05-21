extends Node
@export var pressed = Texture
@export var released = Texture
@export var SS:Array[Node]
var value:Array[bool]=[false,false,false,false]
func _input(event):
	if event.is_action_pressed("1"):
		SS[0].texture=pressed
		value[0]=true
	if event.is_action_released("1"):
		SS[0].texture=released
		value[0]=false
	if event.is_action_pressed("2"):
		SS[1].texture=pressed
		value[1]=true
	if event.is_action_released("2"):
		SS[1].texture=released
		value[1]=false
	if event.is_action_pressed("3"):
		SS[2].texture=pressed
		value[2]=true
	if event.is_action_released("3"):
		SS[2].texture=released
		value[2]=false
	if event.is_action_pressed("4"):
		SS[3].texture=pressed
		value[3]=true
	if event.is_action_released("4"):
		SS[3].texture=released
		value[3]=false
