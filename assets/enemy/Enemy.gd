extends Area2D

export (PackedScene) var Explosion
var speed

func _ready():
	$AnimatedSprite.play()
	speed = GLOBAL.random(32, 42)

func _physics_process(delta):
	position.y += speed * delta

func death_enemy():
	queue_free()
	explosion_ctrl()
	
func explosion_ctrl():
	var explosion = Explosion.instance()
	explosion.global_position = $ExplosionSpawn.global_position
	get_tree().call_group("level", "add_child", explosion)

func _on_Enemy_area_entered(area):
	if area.is_in_group("shoot"):
		death_enemy()
		GLOBAL.score += 10

func _on_Enemy_body_entered(body):
	if body.is_in_group("player"):
		death_enemy()
		body.queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
