extends CharacterBody2D

@onready var main_menu = preload("res://Areas/UI/Main_Menu/Main_Menu.tscn")
@export var parent_map_node = ""

const SPEED = 600.0
const ACCELERATION = 200
const DECELERATION = 200
const JUMP_VELOCITY = -3000.0

func _ready():
	# If scene is detected to be launched directly, bypassing the main menu, instance the main menu scene for a 
	# second and use its Apply_Config function to add the keybinds to the input map so everything works properly
	if InputMap.action_get_events("Jump").size() <= 0:
		var main_menu_instance = main_menu.instantiate()
		var config = ConfigFile.new()
		config.load("user://config")
		main_menu_instance.Apply_Config(config, true)
		main_menu_instance.queue_free()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 8 * delta
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCELERATION)
	else:
		velocity.x = move_toward(velocity.x, 0, DECELERATION)
		
	move_and_slide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Escape"):
		State.Back_To_Map(parent_map_node)
