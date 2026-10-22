extends Node
class_name TargetNode

@export var TargetCharacterType: CharacterType

@onready var TargetIcon: TextureRect = %TargetIcon

enum CharacterType {Enemies, Player}

func _ready() -> void:
	
	_set_group()
	
func _set_group() -> void:
	
	if TargetCharacterType == CharacterType.Player:
		add_to_group("player")
	if TargetCharacterType == CharacterType.Enemies:
		add_to_group("enemies")
