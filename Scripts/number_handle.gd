extends Node
var S1
var S2
var S3
var S4
var value:int = 0
func _ready() -> void:
	S1 = get_node("1")
	S2 = get_node("2")
	S3 = get_node("3")
	S4 = get_node("4")
func _input(event):
	if event.is_action_pressed("1"):
		S1.texture=load("res://Assets/Textures/Sprites/Test Text Box.png")
		value+=1000
	if event.is_action_released("1"):
		S1.texture=load("res://Assets/Textures/Sprites/icon.svg")
		value-=1000
	if event.is_action_pressed("2"):
		S2.texture=load("res://Assets/Textures/Sprites/Test Text Box.png")
		value+=100
	if event.is_action_released("2"):
		S2.texture=load("res://Assets/Textures/Sprites/icon.svg")
		value-=100
	if event.is_action_pressed("3"):
		S3.texture=load("res://Assets/Textures/Sprites/Test Text Box.png")
		value+=10
	if event.is_action_released("3"):
		S3.texture=load("res://Assets/Textures/Sprites/icon.svg")
		value-=10
	if event.is_action_pressed("4"):
		S4.texture=load("res://Assets/Textures/Sprites/Test Text Box.png")
		value+=1
	if event.is_action_released("4"):
		S4.texture=load("res://Assets/Textures/Sprites/icon.svg")
		value-=1
	print(value)
