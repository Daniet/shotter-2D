extends Node2D

func _ready():
	$AnimatedSprite.play()
	$SoundEplosion.play()

func _on_SoundExplosion_finished():
	queue_free()


func _on_SoundEplosion_finished():
	queue_free()
