extends CharacterBody2D

@onready var fog = %Fog

const FOG_CLEARING_ACCELERATION = 220
const RETRACING_ACCELERATION = 950
const FOG_CLEARING_SPEED = 90
const RETRACING_SPEED = 350
const JUMP_VELOCITY = -400.0

var direction : Vector2
var acceleration = FOG_CLEARING_ACCELERATION
var speed = FOG_CLEARING_SPEED
var fog_texture


func _ready():
	fog_texture = fog.fog_texture.get_image()

func _physics_process(delta: float) -> void:
	fog_texture = fog.fog_texture.get_image()
	if fog_texture.get_pixel(self.position.x / 4, self.position.y / 4).a < 0.06:
		acceleration = RETRACING_ACCELERATION
		speed = RETRACING_SPEED
	else:
		if self.velocity.length() <= ((FOG_CLEARING_SPEED + RETRACING_SPEED) / 2.0):
			acceleration = FOG_CLEARING_ACCELERATION
		speed = FOG_CLEARING_SPEED
	
	direction = Vector2(
		Input.get_action_strength("Right") - Input.get_action_strength("Left"),
		Input.get_action_strength("Down") - Input.get_action_strength("Up")).normalized()
	if direction:
		velocity.x = move_toward(velocity.x, direction.x * speed, acceleration * delta)
		velocity.y = move_toward(velocity.y, direction.y * speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration * delta)
		velocity.y = move_toward(velocity.y, 0, acceleration * delta)
	
	move_and_slide()
