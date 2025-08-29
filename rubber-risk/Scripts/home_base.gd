extends Node2D


func _on_upgrade_station_pressed() -> void:
	get_tree().change_scene_to_file("res://Map/upgrades.tscn")

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Map/test_map.tscn")
