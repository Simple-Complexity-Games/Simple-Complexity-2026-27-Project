extends Node
class_name TurnBasedController

var Possible_Characters: Array[TurnBasedAgent] = []
var Encounter_Size = 0
var Turn_Order: Array[TurnBasedAgent] = []
var Current_Character: TurnBasedAgent

func _ready() -> void:
	
	Encounter_Size = randi_range(2, 4)
	
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
		Possible_Characters.append(node)
	
	for node in Possible_Characters:
		if Turn_Order.size() < Encounter_Size:
			node.Spawned = true
			Turn_Order.append(node)
	
	print("Encounter with ", (Encounter_Size - 1), " enemies has started")
	
func _set_next_active_character():
	
	if Current_Character:
		Turn_Order.pop_front()
	
	if Turn_Order.is_empty():
		#trigger_attacks()
		_set_turn_order()
	
	Current_Character = Turn_Order[0]
	Current_Character.set_active(true)
