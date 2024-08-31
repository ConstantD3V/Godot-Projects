extends Node2D


signal coin_collected

func _ready():
	$AnimatedSprite.play("idle")


func _on_Area2D_body_entered(body):
	if body.is_in_group("player") and body is KinematicBody2D:
		emit_signal("coin_collected")
		Global.coin_collected = true
		queue_free()
		$AudioStreamPlayer.stream = load("res://coin_SFX.wav")
		$AudioStreamPlayer.play()








