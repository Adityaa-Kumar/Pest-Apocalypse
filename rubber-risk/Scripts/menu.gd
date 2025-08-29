extends Node3D
@onready var pickup_armour: Node3D = $car_selector/pickup_armour
@onready var sedan_armour: Node3D = $car_selector/sedan_armour
@onready var truck_armour: Node3D = $car_selector/truck_armour

func _process(delta: float) -> void:
	pass
	#$Camera3D/CanvasLayer/Metal/Label_metal.text = "Metal: "+str(Global.player_resource_global.Metal)

func _on_button_pressed() -> void:
	if pickup_armour.visible == true:
		Global.selected_car = Global.vehicle.PICKUP
	elif sedan_armour.visible == true:
		Global.selected_car = Global.vehicle.SEDAN
	elif truck_armour.visible == true:
		Global.selected_car = Global.vehicle.TRUCK
	get_tree().change_scene_to_file("res://Map/home_base.tscn")

func _on_button_2_pressed() -> void:
	get_tree().quit(0)

func _on_button_3_pressed() -> void:
	if pickup_armour.visible == true:
		sedan_armour.visible = true
		pickup_armour.visible = false
		truck_armour.visible = false
	elif sedan_armour.visible == true:
		pickup_armour.visible = false
		sedan_armour.visible = false
		truck_armour.visible = true
	elif truck_armour.visible == true:
		pickup_armour.visible = true
		sedan_armour.visible = false
		truck_armour.visible = false

func _on_button_4_pressed() -> void:
	if pickup_armour.visible == true:
		sedan_armour.visible = false
		pickup_armour.visible = false
		truck_armour.visible = true
	elif sedan_armour.visible == true:
		pickup_armour.visible = true
		sedan_armour.visible = false
		truck_armour.visible = false
	elif truck_armour.visible == true:
		pickup_armour.visible = false
		sedan_armour.visible = true
		truck_armour.visible = false


func _on_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://Map/home_base.tscn")

func _on_health_up_pressed() -> void:
	if Global.player_resource_global.Metal >= 10:
		if Global.selected_car == Global.vehicle.PICKUP:
			Global.pickup_health += 10
			Global.player_resource_global.Metal -= 10
		elif Global.selected_car == Global.vehicle.SEDAN:
			Global.sedan_health += 10
			Global.player_resource_global.Metal -= 10
		elif Global.selected_car == Global.vehicle.TRUCK:
			Global.truck_health += 10
			Global.player_resource_global.Metal -= 10

func _on_damage_up_pressed() -> void:
	pass # Replace with function body.
