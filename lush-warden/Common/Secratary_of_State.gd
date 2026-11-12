extends Node

var Health = 9
var Max_Health = 9
var Items = {"placeholder":"res://Items/Placeholder.tscn"}

var travel_node_suffix = "_Vignette_Travel_Node"


func Back_To_Map(player_map_parent_node):
	var map_scene_file = load("res://Areas/Top-Down/map.tscn")
	var map_scene = map_scene_file.instantiate()
	map_scene.get_node("Top_Down_Player").position = map_scene.get_node(player_map_parent_node + travel_node_suffix).position
	
	var player_save_file = ConfigFile.new()
	player_save_file.set_value("Location", "Last_Vignette", player_map_parent_node)
	player_save_file.save("user://player_save_1")
	
	get_tree().root.add_child(map_scene)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = map_scene

func Change_To_Scene(scene):
	get_tree().root.add_child(scene)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = scene
