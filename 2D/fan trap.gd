extends Area2D




func _on_fan_trap_body_entered(body):
	$AnimatedSprite.play("fan")
	if body is KinematicBody2D:
		get_tree().change_scene("res://GameOver.tscn")
