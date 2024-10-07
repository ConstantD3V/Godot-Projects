extends Area2D


# Called when the node enters the scene tree for the first time.

@onready var game_mngr = %GameMngr


func _on_body_entered(body):
	game_mngr.add_points()
	queue_free()
