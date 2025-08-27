extends VehicleBody3D

#region export vars
@export var horsepower :float = 100.0
@export var reverse_power :float = -80.0
@export var steer_angle :float = 30.0
@export var acceleration :float = 2
@export var rev_acceleration :float = 5
@export var drag :float = 1
@export var steer_speed :float = 4.0
@export var brake_power :float = 6
#endregion

#region reference
@onready var back_cam: PhantomCamera3D = %PlayerPhantomCamera3D
@onready var front_cam: PhantomCamera3D = %PlayerPhantomCamera3D2
#endregion

#region player resources
@export var player_resource :Reward
#endregion

#region onready vars
@onready var gpu_particles_3d_l: GPUParticles3D = $GPUParticles3D
#endregion

#region vars
var current_power :float = 0.0
var health :float = 100
var is_cam_back :bool = true
#endregion

var br :bool = false

#regions funcs
func _ready() -> void:
	player_resource = Reward.new()
	Global.player_health = health

func _physics_process(delta: float) -> void:
	engine_force = current_power
	
	if Input.is_action_pressed("throttle_up"):
		current_power = lerp(current_power, horsepower, acceleration * delta)
	elif Input.is_action_pressed("throttle_down"):
		current_power = lerp(current_power, reverse_power, rev_acceleration * delta)
	else:
		current_power = lerp(current_power, 0.0, drag * delta)
	
	if Input.is_action_pressed("steer_left"):
		steering = lerp_angle(steering, deg_to_rad(steer_angle), steer_speed * delta)
	elif Input.is_action_pressed("steer_right"):
		steering = lerp_angle(steering, deg_to_rad(-steer_angle), steer_speed * delta)
	else:
		steering = lerp_angle(steering, deg_to_rad(0.0), steer_speed * delta)
	
	gpu_particles_3d_l.emitting = true if engine_force else false
	
	if Input.is_action_pressed("brake"):
		brake = brake_power
	else:
		mass = 40
		brake = 0
	
	Global.player_resource_global = player_resource
	
	if Input.is_action_just_pressed("rotate_cam") and is_cam_back:
		back_cam.priority = 0
		front_cam.priority = 1
		is_cam_back = false
	elif Input.is_action_just_pressed("rotate_cam") and not is_cam_back:
		back_cam.priority = 1
		front_cam.priority = 0
		is_cam_back = true
	
	if Input.is_action_just_pressed("reset"):
		self.rotation = Vector3.ZERO
	

func set_resource(resource :Reward) -> void:
	player_resource.Ammo += resource.Ammo
	player_resource.Metal += resource.Metal
	player_resource.Parley_JEE += resource.Parley_JEE

#endregion
