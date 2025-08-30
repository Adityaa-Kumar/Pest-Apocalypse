extends Node2D


func _on_upgrade_station_pressed() -> void:
	SceneLoader.load_scene("res://Map/upgrades.tscn")

func _on_exit_pressed() -> void:
	SceneLoader.load_scene("res://Map/test_map.tscn")
