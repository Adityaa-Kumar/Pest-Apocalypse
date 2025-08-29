extends Node

var player_resource_global :Reward
var player_health :int
enum vehicle {PICKUP, SEDAN, TRUCK}
var selected_car :vehicle
var player_speed :int
var player_position :Vector3
var pickup_health :int
var sedan_health :int
var truck_health :int
var Metal

func _ready() -> void:
	if selected_car == vehicle.PICKUP:
		player_health = pickup_health
	elif selected_car == vehicle.SEDAN:
		player_health = sedan_health
	elif selected_car == vehicle.TRUCK:
		player_health = truck_health
