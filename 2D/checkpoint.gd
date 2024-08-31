extends Area2D




func _on_checkpoint_body_entered(body):
	$AnimatedSprite.play("idle")
	if body is KinematicBody2D:
		get_tree().change_scene("res://LevelComplete.tscn")
