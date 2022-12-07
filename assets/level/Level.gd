extends Node2D

export (PackedScene) var Enemy

func _ready():
	$BgMusic.play()
	$EnemyTimer.start()
	randomize()
	
func _physics_process(_delta: float) -> void:
	get_node("Background").scroll_base_offset += Vector2(0, 1) * 8 * _delta
	get_node("Clouds01").scroll_base_offset += Vector2(0, 1) * 24 * _delta
	get_node("Clouds02").scroll_base_offset += Vector2(0, 1) * 34 * _delta



func _on_HUB_game_over():
	$BgMusic.stop()


func _on_EnemyTimer_timeout():
	get_node("EnemyPath/EnemySpawn").set_offset(randi())
	var enemy = Enemy.instance()
	add_child(enemy)
	enemy.position = get_node("EnemyPath/EnemySpawn").position
	$EnemyTimer.wait_time = GLOBAL.random(1, 3)
	$EnemyTimer.start()
