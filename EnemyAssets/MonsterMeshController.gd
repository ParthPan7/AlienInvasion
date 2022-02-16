extends Spatial

var player = null
var grenade_scene = preload("res://Assets/Grenade.tscn")
const GRENADE_THROW_FORCE = 3
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var animation_player = null
		#fire_grenade()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func fire_grenade():
	if player and grenade_scene and is_instance_valid(player):
		print('grenade fired')
		var grenade_clone
		grenade_clone = grenade_scene.instance()
		get_tree().root.add_child(grenade_clone)
		grenade_clone.transform = $ReleasePoint.global_transform
		var distance  = get_transform().origin.distance_to(player.transform.origin)
		grenade_clone.apply_impulse(Vector3(0,0,0), grenade_clone.global_transform.basis.z * distance * GRENADE_THROW_FORCE)


func _physics_process(delta):
	pass
	
func _on_Area_body_entered(body):
	if !body.is_in_group("Player"):
		return
	player = body	

