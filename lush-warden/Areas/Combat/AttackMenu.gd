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
	
	add_to_group("AttackMenu")
	
	Fast_Attack_Button.pressed.connect(_on_attack_pressed.bind(Fast_Attack))
	Medium_Attack_Button.pressed.connect(_on_attack_pressed.bind(Medium_Attack))
	Slow_Attack_Button.pressed.connect(_on_attack_pressed.bind(Slow_Attack))
	
	#Main_Commands.grab_focus()
	
func _on_attack_pressed(command: Resource):
	
	Attack_Selected.emit(command)
	print(command)
	
	
	
	
	
