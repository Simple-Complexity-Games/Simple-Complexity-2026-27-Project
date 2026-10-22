extends Node

var Health = 9
var Max_Health = 9


func Back_To_Map(player_map_parent_node):
	var map_scene_file = load("res://Areas/Top-Down/map.tscn")
	var map_scene = map_scene_file.instantiate()
	map_scene.get_node("Top_Down_Player").position = map_scene.get_node(player_map_parent_node).position
	get_tree().root.add_child(map_scene)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = map_scene
