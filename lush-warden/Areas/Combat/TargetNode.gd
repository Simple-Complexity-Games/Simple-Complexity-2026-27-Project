extends Node
class_name TurnBasedAgent

@export var Target_Character_Type: Character_Type
@export var Target_Icon_Offset: Vector2 = Vector2(50, 0)
@export var On_Turn_Icon_Offset: Vector2 = Vector2(0, -50)

@onready var Target_Icon: TextureRect = %TargetIcon
@onready var On_Turn_Icon: TextureRect = %OnTurnIcon
@onready var Attack_Resource = preload("res://Areas/Combat/AttackResource.gd")

@export var Is_Active = false

var Selected_Attack: Resource
var Target: TurnBasedAgent

enum Character_Type {Enemy, Player}

signal Target_Confirmed(target: TurnBasedAgent, command: Resource)
signal Attack_Cancelled
signal Selection_Finished

func _get_global_position():
	
	return get_parent().global_position
	
func _selection_finished():
	
	Selection_Finished.emit()

func _ready() -> void:
	
	_set_group()
	_set_target_icon()
	_set_on_turn_icon()
	_set_late_signals()
	
func _input(event: InputEvent) -> void:
	
	if not Target: 
		return
	
	var All_Enemies = get_tree().get_nodes_in_group("Enemies")
	var Player_Target = get_tree().get_node_in_group("Player")
	
	if Target in All_Enemies:
		_select_between_targets(event, All_Enemies)
	elif Target in Player_Target:
		_select_between_targets(event, Player_Target)
		
	if event.is_action_pressed("Select"):
		_confirm_target()
	if event.is_action_pressed("Cancel"):
		_cancel_targeting()

func _confirm_target():
	
	Target_Confirmed.emit(Target, Selected_Attack)
	_deselect_all_targets()
	_set_active(false)
	Target = null

func _set_active(boolean: bool) -> void:
	
	Is_Active = boolean
	
	if Is_Active:
		pass
	else:
		pass

func _set_on_turn_icon():
	
	On_Turn_Icon.hide()
	On_Turn_Icon.global_position = get_parent().global_position -(On_Turn_Icon.get_global_rect().size / 2) + On_Turn_Icon_Offset

func _cancel_targeting():
	
	Target = null
	_deselect_all_targets()
	Attack_Cancelled.emit()

func _select_between_targets(event: InputEvent, targets: Array):
	
	var Current_Target_Index = targets.find(Target, 0)
	
	var Select_Left = event.is_action_pressed("Left")
	var Select_Right = event.is_action_pressed("Right")
	
	if not Select_Left or Select_Right:
		return
	
	if Select_Left:
		Current_Target_Index -= 1
		if Current_Target_Index < 0:
			Current_Target_Index = targets.size() - 1
	elif Select_Right:
		Current_Target_Index -= 1
		if Current_Target_Index > targets.size():
			Current_Target_Index = 0
	
	_deselect_all_targets()
	Target = targets[Current_Target_Index]
	Target.set_target()
	print(Target)

func _deselect_all_targets():
	
	var All_Targets = get_tree().get_all_nodes_in("Enemies") + get_tree().get_all_nodes_in("Player")
	
	for target in All_Targets:
		target.Target_Icon.hide()

func _set_group():
	
	add_to_group("TurnBasedAgents")
	
	if Target_Character_Type == Character_Type.Player:
		add_to_group("Player")
	elif Target_Character_Type == Character_Type.Enemy:
		add_to_group("Enemies")

func _set_target_icon():
	
	Target_Icon.hide()
	Target_Icon.global_position = get_parent().global_position - (Target_Icon.get_global_rect().size / 2) - Target_Icon_Offset
	Target_Icon.modulate = Color(1, 0, 0)

func _set_late_signals():
	
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
