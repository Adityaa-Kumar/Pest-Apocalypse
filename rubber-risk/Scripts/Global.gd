extends Node

var player_resource_global :Reward
var player_health :int
var player_ammo :int
enum vehicle {PICKUP, SEDAN, TRUCK}
var selected_car :vehicle
var player_speed :int
var player_position :Vector3
var player_resources_global :Reward = Reward.new()

var save_data = SaveData.new()

var score: int = 0
var pickup_ammo: int = 250
var sedan_ammo: int = 250
var truck_ammo: int = 250
var pickup_health: int = 100
var sedan_health: int = 100
var truck_health: int = 100
var metal: int = 0

func _ready() -> void:
	if selected_car == vehicle.PICKUP:
		player_health = pickup_health
		player_ammo = pickup_ammo
	elif selected_car == vehicle.SEDAN:
		player_health = sedan_health
		player_ammo = sedan_ammo
	elif selected_car == vehicle.TRUCK:
		player_health = truck_health
		player_ammo = truck_ammo
		
func save_game():
	var save_data = SaveData.new()
	save_data.score = score
	save_data.pickup_health = pickup_health
	save_data.sedan_health = sedan_health
	save_data.truck_health = truck_health
	save_data.pickup_ammo = pickup_ammo
	save_data.sedan_ammo = sedan_ammo
	save_data.truck_ammo = truck_ammo
	save_data.metal = metal
	ResourceSaver.save(save_data, "user://savegame.tres")

func load_game():
	if ResourceLoader.exists("user://savegame.tres"):
		var save_data = ResourceLoader.load("user://savegame.tres")
		score = save_data.score
		pickup_health = save_data.pickup_health
		sedan_health = save_data.sedan_health
		truck_health = save_data.truck_health
		pickup_ammo = save_data.pickup_ammo
		sedan_ammo = save_data.sedan_ammo
		truck_ammo = save_data.truck_ammo
		metal = save_data.metal
