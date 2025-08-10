extends Node

enum EPISODE {
	EPISODE1,
	EPISODE2,
	EPISODE3,
	EPISODE4,
	EPISODE5,
	EPISODE6,
	EPISODE7,
	EPISODE8,
	EPISODE9,
	EPILOGUE
}

var playing_episode: DialogResource

const EPISODE_LIST: Array[DialogResource] = [
	preload("res://Resources/Dialog Resources/Chapter1.tres"),
	preload("res://Resources/Dialog Resources/Chapter2.tres"),
	preload("res://Resources/Dialog Resources/Chapter3.tres"),
	preload("res://Resources/Dialog Resources/Chapter4.tres"),
	preload("res://Resources/Dialog Resources/Chapter5.tres"),
	preload("res://Resources/Dialog Resources/Chapter6.tres"),
	preload("res://Resources/Dialog Resources/Chapter7.tres"),
	preload("res://Resources/Dialog Resources/Chapter8.tres"),
	preload("res://Resources/Dialog Resources/Chapter9.tres"),
	preload("res://Resources/Dialog Resources/Epilogue.tres")
]

const STORY_MODE = preload("res://Scenes/Story Mode/StoryMode.tscn")
const MAIN_MENU = preload("res://Scenes/Main Menu/MainMenu.tscn")
const CONCERT = preload("res://Scenes/Story Mode/Concert.tscn")

func change_playing_episode(new_episode: DialogResource) -> void:
	playing_episode = new_episode

func go_to_story_mode() -> void:
	get_tree().change_scene_to_packed(STORY_MODE)

func go_to_main_menu() -> void:
	get_tree().change_scene_to_packed(MAIN_MENU)

func change_scene(new_scene: PackedScene) -> void:
	get_tree().change_scene_to_packed(new_scene)

func go_to_concert() -> void:
	get_tree().change_scene_to_packed(CONCERT)
