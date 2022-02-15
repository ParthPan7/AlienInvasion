extends KinematicBody

#var grenade_scene = preload("res://GrenadeAssets/Grenade.tscn")
const GRENADE_THROW_FORCE = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var animation_player = null
var player = null
var locChange = false
var playerPositionTrack 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var health = 180

# Called when the node enters the sce


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		queue_free()
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player = $MonsterMeshHolder/AnimationPlayer
	pass # Replace with function body.

func rotateInDirectionOfPlayer():	
	if player:
		var player_transform = player.get_global_transform().origin
		look_at(player_transform , Vector3(0,1,0))
		self.rotate_object_local(Vector3.UP, PI);
		
	
func _physics_process(delta):
	rotateInDirectionOfPlayer()		
	animation_player.play("Throw_Loop")	


func _on_Area_body_entered(body):
	if !body.is_in_group("Player"):
		#set_physics_process(false)
		return
	print('Player Detected')	
	player = body
	set_physics_process(true)
		
