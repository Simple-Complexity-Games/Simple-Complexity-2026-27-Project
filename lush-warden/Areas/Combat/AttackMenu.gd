extends Control

@onready var FastAttackButton = %FastAttackButton
@onready var MediumAttackButton = %MediumAttackButton
@onready var SlowAttackButton = %SlowAttackButton

@onready var MainCommands: VBoxContainer = %MainCommands

signal AttackSelected(command: Resource)

const CommandButton = preload("res://Areas/Combat/CommandButton.tscn")

const FastAttack = preload("res://Areas/Combat/FastAttack.tres")
const MediumAttack = preload("res://Areas/Combat/MediumAttack.tres")
const SlowAttack = preload("res://Areas/Combat/SlowAttack.tres")

func _ready() -> void:
	
	add_to_group("AttackMenu")
	
	FastAttackButton.pressed.connect(_on_attack_pressed.bind(FastAttack))
	MediumAttackButton.pressed.connect(_on_attack_pressed.bind(MediumAttack))
	SlowAttackButton.pressed.connect(_on_attack_pressed.bind(SlowAttack))
	
func _on_attack_pressed(command: Resource):
	
	AttackSelected.emit(command)
	
	
	
	
	
