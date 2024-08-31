extends Area2D




func _on_spike_body_entered(body):
	if body is KinematicBody2D:
		get_tree().change_scene("res://GameOver.tscn")
