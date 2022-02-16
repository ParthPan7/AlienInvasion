extends PopupMenu


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var selected_menu = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func change_menu_color():
	$Restart.color = Color.gray
	$Exit.color = Color.gray
	
	match selected_menu:
		0:
			$Restart.color = Color.greenyellow
		1:
			$Exit.color = Color.greenyellow
		
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if Input.is_action_just_pressed("ui_down"):
			selected_menu = (selected_menu + 1) % 2;
			change_menu_color()

	elif Input.is_action_just_pressed("ui_accept"):
			match selected_menu:
				0:
					# Restart game
					get_tree().reload_current_scene()
					get_tree().paused = false
				1:
					# Quit game
					get_tree().quit()
					
func _on_Player_player_death_signal(body):
	get_tree().paused = true
	body.set_process_input(false)  
	selected_menu = 0
	popup()
	change_menu_color()
