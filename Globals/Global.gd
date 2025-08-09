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
	EPISODE9
}

var playing_episode: DialogResource

const EPISODE_LIST: Array[DialogResource] = [
	preload("res://Resources/Dialog Resources/Chapter1.tres")
]

const STORY_MODE = preload("res://Scenes/Story Mode/StoryMode.tscn")
const MAIN_MENU = preload("res://Scenes/Main Menu/MainMenu.tscn")

func change_playing_episode(new_episode: DialogResource) -> void:
	playing_episode = new_episode

func go_to_story_mode() -> void:
	get_tree().change_scene_to_packed(STORY_MODE)

func go_to_main_menu() -> void:
	get_tree().change_scene_to_packed(MAIN_MENU)
