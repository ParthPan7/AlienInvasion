extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var muzzle_animation = null

func fireRifle():
	if Input.is_action_pressed("aim") && Input.is_action_just_pressed("fire"):
		visible = true
		muzzle_animation.play("muzzle_flash")
		
	else:
		muzzle_animation.stop()
		visible = false



# Called when the node enters the scene tree for the first time.
func _ready():
	muzzle_animation = get_node("MuzzleFlashAnimation")
	pass # Replace with function body.

func _physics_process(delta):
	fireRifle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
