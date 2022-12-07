extends Area2D

onready var player: KinematicBody2D = get_tree().get_nodes_in_group("player")[0]

const SPEED = 100

func _ready():
	player.can_shoot = false
	$AnimatedSprite.play()
	$SoundShoot.play()
	
func _physics_process(delta):
	position.y -= SPEED * delta
	
func _on_Shoot_area_entered(area):
	if area.is_in_group("enemy"):
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	player.can_shoot = true
	queue_free()
 
