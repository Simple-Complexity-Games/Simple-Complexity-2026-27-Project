extends Node
class_name TurnBasedController

var TurnOrder: Array[TurnBasedAgent] = []
var CurrentCharacter: TurnBasedAgent

func _ready() -> void:
	
	print("ControllerReady")
	
	add_to_group("TurnBasedController")
	
	_set_after_all_ready()
	
	
func _set_after_all_ready():
	
	await get_tree().create_timer(0.1).timeout
	
	_set_turn_order()
	_set_next_active_character()
	_set_later_signals()
	
func _set_later_signals():
	
	for Player: TurnBasedAgent in get_tree().get_nodes_in_group("TargetNodes"):
		Player.Turn_Finished.connect(_on_turn_done)
	
func _on_turn_done():
	
	_set_next_active_character()

func _set_turn_order():
	
	var Player = get_tree().get_nodes_in_group("Player")
	var Enemies = get_tree().get_nodes_in_group("Enemies")
	
	for node in Player + Enemies:
		TurnOrder.append(node)
	
	print(TurnOrder)
	
func _set_next_active_character():
	
	if CurrentCharacter:
		TurnOrder.pop_front()
	
	if TurnOrder.is_empty():
		#trigger_attacks()
		_set_turn_order()
	
	CurrentCharacter = TurnOrder[0]
	CurrentCharacter.set_active(true)
	
	
