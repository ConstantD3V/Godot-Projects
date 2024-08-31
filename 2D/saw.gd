extends Area2D


func _ready():
	$AnimatedSprite.play("chain")

func _on_saw_body_entered(body):
	if body is KinematicBody2D:
		get_tree().change_scene("res://GameOver.tscn")
