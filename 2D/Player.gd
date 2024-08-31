extends KinematicBody2D

var motion= Vector2()

const SPEED = 300
const GRAVITY = 40
const UP = Vector2(0,-1)
const JUMP_SPEED = 670
const WORLD_LIMIT = 800


func _physics_process(delta):
	if Input.is_action_pressed("LEFT") and not Input.is_action_pressed("RIGHT"):
		motion.x = -SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h= true 
	elif Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT"):
		motion.x = SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h= false
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")
	if Input.is_action_pressed("JUMP") and is_on_floor():
		motion.y -= JUMP_SPEED
		$AudioStreamPlayer.stream = load("res://Jump.wav")
		$AudioStreamPlayer.play()
	if motion.y < 0:
		$AnimatedSprite.play("jump")
	
	move_and_slide(motion,UP)
	
	if not is_on_floor() and motion.y>0:
		$AnimatedSprite.play("fall")
	
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY
	
	if position.y > WORLD_LIMIT:
		get_tree().change_scene("res://GameOver.tscn")
	

func _on_saw_body_entered(body):
	if body is KinematicBody2D:
		$AnimatedSprite.play("hurt")
