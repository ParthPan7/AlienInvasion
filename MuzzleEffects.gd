extends BoneAttachment


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func fireRifle():
	if Input.is_action_pressed("aim") && Input.is_action_just_pressed("fire"):
		visible = true
		get_node("Muzzle").get_node("MuzzleFlashAnimation").play("muzzle_flash")
		
	else:
		#get_node("Muzzle").get_node("MuzzleFlashAnimation").stop()
		visible = false
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	fireRifle()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
