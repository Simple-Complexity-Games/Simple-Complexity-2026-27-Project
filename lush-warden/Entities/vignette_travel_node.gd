extends Node2D

@onready var Sprite = self.get_node("Sprite2D")
@onready var fog = get_parent().get_node("Fog")
@export var vignette_file_name = ""

var area_occupied = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Sprite.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if area_occupied and Input.is_action_just_pressed("Jump"):
		if not vignette_file_name:
			print("ERROR: Vignette file name missing, cannot load scene")
		else:
			var vignette_scene = load("res://Areas/Vignettes/" + vignette_file_name + ".tscn").instantiate()
			
			fog.fog_texture.get_image().save_png("user://fog_state.png")
			
			var player_save_file = ConfigFile.new()
			player_save_file.set_value("Location", "Last_Vignette", vignette_scene.get_node("Player").parent_map_node)
			player_save_file.save("user://player_save_1")
			
			State.Change_To_Scene(vignette_scene)


func _on_area_2d_area_entered(body: Node2D) -> void:
	area_occupied = true
	Sprite.frame = 1

func _on_area_2d_area_exited(body: Node2D) -> void:
	area_occupied = false
	Sprite.frame = 0
