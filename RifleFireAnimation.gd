extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rifle_animation = null

# Called when the node enters the scene tree for the first time.
func _ready():
	rifle_animation = get_node("RifleFireAnimation")
	pass # Replace with function body.

func _physics_process(delta):
		if Input.is_action_pressed("fire") && Input.is_action_pressed("aim"):
			rifle_animation.play("RifleFireAnimation")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
