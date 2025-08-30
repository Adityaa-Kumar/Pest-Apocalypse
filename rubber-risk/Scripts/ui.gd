extends CanvasLayer

@onready var pause_menu: Control = $PauseMenu
var game_paused: bool = false

func _ready() -> void:
	pause_menu.set_process_mode(2)

func _process(delta: float) -> void:
	$lable_snap/Label_health.text = "Health: "+str(Global.player_health)
	$lable_snap/Label_ammo.text = "Ammo: "+str(Global.player_resource_global.Ammo)
	$lable_snap/Label_metal.text = "Metal: "+str(Global.player_resource_global.Metal)
	$lable_snap/Label_Parley_JEE.text = "Parley-JEE: "+str(Global.player_resource_global.Parley_JEE)
	
	if Input.is_action_just_pressed("esc") and game_paused == false:
			game_paused = true
			pause_menu.show()
			get_tree().paused = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_play_pressed() -> void:
	get_tree().paused = false
	game_paused = false
	pause_menu.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_home_pressed() -> void:
	get_tree().paused = false
	game_paused = false
	pause_menu.hide()
	get_tree().change_scene_to_file("res://Map/home_base.tscn")

func _on_mm_btn_pressed() -> void:
	get_tree().paused = false
	game_paused = false
	pause_menu.hide()
	get_tree().change_scene_to_file("res://Map/menu_debug.tscn")
