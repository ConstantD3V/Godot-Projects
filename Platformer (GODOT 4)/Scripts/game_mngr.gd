extends Node

var score = 0

@onready var label = $score

func add_points():
	score += 1
	label.text = "You collected  " +str(score)+ " coins"
