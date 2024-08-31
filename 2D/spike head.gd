extends Area2D



func _on_Spikehead_body_entered(body):
	$AnimatedSprite.play("idle")
	if body is KinematicBody2D:
		get_tree().change_scene("res://GameOver.tscn")
