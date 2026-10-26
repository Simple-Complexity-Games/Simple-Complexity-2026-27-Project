extends Node
class_name TurnBasedAgent

@export var Target_Character_Type: Character_Type
@export var Target_Icon_Offset: Vector2 = Vector2(50, 0)

@onready var Target_Icon: TextureRect = %TargetIcon
@onready var Attack_Resource = preload("res://Areas/Combat/AttackResource.gd")

@export var Is_Active = false
var Selected_Attack: Resource
var Target: TurnBasedAgent

enum Character_Type {Enemy, Player}

func _ready() -> void:
	
	_set_group()
	_set_target_icon()
	_set_late_signals()
	
func _input(event: InputEvent) -> void:
	pass
	
func _set_group() -> void:
	
	if Target_Character_Type == Character_Type.Player:
		add_to_group("Player")
	elif Target_Character_Type == Character_Type.Enemy:
		add_to_group("Enemies")

func _set_target_icon() -> void:
	
	Target_Icon.hide()
	Target_Icon.global_position = get_parent().global_position - (Target_Icon.get_global_rect().size / 2) - Target_Icon_Offset
	Target_Icon.modulate = Color(1, 0, 0)
	
func _set_late_signals() -> void:
	
	await get_tree().current_scene.ready
	
	var Attack_Menu = get_tree().get_first_node_in_group("AttackMenu")
	Attack_Menu.Attack_Selected.connect(_on_attack_pressed)
	
func _on_attack_pressed(command: Resource) -> void:
	
	if not Is_Active:
		return
		
	Selected_Attack = command
	
	if command.Target_Type == Attack_Resource.Target_Type.Enemy:
		Target = get_tree().get_first_node_in_group("Enemies")
	elif command.Target_Type == Attack_Resource.Target_Type.Player:
		Target = get_tree().get_node_in_group("Player")
		
	Target.set_target()
	
func set_target():
	
	Target_Icon.show()
