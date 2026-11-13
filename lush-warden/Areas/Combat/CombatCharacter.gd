extends StaticBody2D

@onready var Target_Node = $TargetNode

func _ready() -> void:
	Target_Node.Target_Confirmed.connect(_on_character_action) 
	
func _input(event: InputEvent):
	
	var targ2et = get_tree().get_first_node_in_group("Player")
	
	
	if event.is_action_pressed("murdertest"):
		_animation_example(targ2et)

func _on_character_action(target: TurnBasedAgent, attack: Resource):
	
	_animation_example(target)
	
func _animation_example(target):
	
	#var running = true
	var orbofpain = get_node("orbofpain")
	
	var Starting_Position = global_position
	var Target_Position = target._get_global_position()
	
	if not is_in_group("Player"):
		var animsprite = get_node("Sprite2D")
		animsprite.play("murderorbshoot")
		await get_tree().create_timer(0.5).timeout
	
	orbofpain.show()
	var murdertween = get_tree().create_tween()
	murdertween.tween_property(orbofpain, "global_position", Target_Position, 0.5)
	murdertween.tween_property(orbofpain, "global_position", Starting_Position, 0.5)
	
	await murdertween.finished
	orbofpain.hide()
	#running = false
	
	Target_Node.command_done()
