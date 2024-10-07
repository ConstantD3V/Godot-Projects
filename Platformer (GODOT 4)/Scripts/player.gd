extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):

	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	


	var direction = Input.get_axis("LEFT", "RIGHT")
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		elif direction > 0:
			animated_sprite_2d.flip_h = false
			animated_sprite_2d.play("run")
		elif direction < 0 :
			animated_sprite_2d.flip_h = true
			animated_sprite_2d.play("run")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_killzone_body_exited(body):
	if is_on_floor():
		$AnimatedSprite2D.play("Hit")
