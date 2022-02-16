extends Spatial

var players_progress_bar = null
var red_bar = preload("res://Assets/ProgressBars/barHorizontal_red.png")
var green_bar = preload("res://Assets/ProgressBars/barHorizontal_green.png")
var yellow_bar = preload("res://Assets/ProgressBars/barHorizontal_yellow.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	players_progress_bar = $PlayersProgressBar
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_player_health_decline_signal(players_health):
	#print ('from Player health bar script'+ str(players_health) )
	players_progress_bar.texture_progress = green_bar
	if players_health < players_progress_bar.max_value * 0.7:
		players_progress_bar.texture_progress = yellow_bar
	if players_health < players_progress_bar.max_value * 0.35:
		players_progress_bar.texture_progress = red_bar	
	if players_health < players_progress_bar.max_value:
		show()
	players_progress_bar.value  = players_health	
