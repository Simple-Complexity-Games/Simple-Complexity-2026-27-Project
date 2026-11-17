extends Control

@onready var Fast_Attack_Button = %FastAttackButton
@onready var Medium_Attack_Button = %MediumAttackButton
@onready var Slow_Attack_Button = %SlowAttackButton

@onready var Main_Commands: VBoxContainer = %MainCommands

signal Attack_Selected(command: Resource)

const Command_Button = preload("res://Areas/Combat/CommandButton.tscn")

const Fast_Attack = preload("res://Areas/Combat/FastAttack.tres")
const Medium_Attack = preload("res://Areas/Combat/MediumAttack.tres")
const Slow_Attack = preload("res://Areas/Combat/SlowAttack.tres")

func _ready() -> void:
	
	print("AttackMenuReady")
	add_to_group("AttackMenu")
	
	_set_latest_signals()
	
	Fast_Attack_Button.pressed.connect(_on_attack_pressed.bind(Fast_Attack))
	Medium_Attack_Button.pressed.connect(_on_attack_pressed.bind(Medium_Attack))
	Slow_Attack_Button.pressed.connect(_on_attack_pressed.bind(Slow_Attack))
	
	Main_Commands.grab_focus()
	
func _set_latest_signals():
	
	await get_tree().current_scene.ready
	
	for Character: TurnBasedAgent in get_tree().get_nodes_in_group("TargetNodes"):
		Character.Player_Turn_Started.connect(_on_player_turn.bind(Character))
		Character.Attack_Cancelled.connect(_on_player_turn.bind(null))
	
func _on_player_turn(character: TurnBasedAgent) -> void:
	
	if character: 
		_set_attack_options(character)
	show()
	Main_Commands.get_children()[0].grab_focus()
	
func _on_attack_pressed(command: Resource):
	
	Attack_Selected.emit(command)
	print(command)
	
func _set_attack_options(character: TurnBasedAgent):
	
	if character.FastAttack:
		Fast_Attack_Button.pressed.connect(_on_attack_pressed.bind(character.FastAttack))
	elif character.MediumAttack:
		Medium_Attack_Button.pressed.connect(_on_attack_pressed.bind(character.MediumAttack))
	elif character.SlowAttack:
		Slow_Attack_Button.pressed.connect(_on_attack_pressed.bind(character.SlowAttack))
	
