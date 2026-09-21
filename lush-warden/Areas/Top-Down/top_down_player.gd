extends CharacterBody2D


const ACCELERATION = 160
const SPEED = 90
const JUMP_VELOCITY = -400.0
var direction : Vector2


func _physics_process(delta: float) -> void:
	direction = Vector2(
		Input.get_action_strength("Right") - Input.get_action_strength("Left"),
		Input.get_action_strength("Down") - Input.get_action_strength("Up")).normalized()
	if direction:
		velocity.x = move_toward(velocity.x, direction.x * SPEED, ACCELERATION * delta)
		velocity.y = move_toward(velocity.y, direction.y * SPEED, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION * delta)
		velocity.y = move_toward(velocity.y, 0, ACCELERATION * delta)
	
	move_and_slide()
