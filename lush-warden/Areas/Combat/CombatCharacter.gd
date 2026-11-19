extends StaticBody2D

@onready var Target_Node = $TargetNode
@onready var Base_Initiative = 0

func _ready() -> void:
	
	Target_Node.Target_Confirmed.connect(_on_character_action) 
	
	await get_tree().create_timer(0.15).timeout
	
	
	if not get_node("TargetNode").is_in_group("Player"):
		Base_Initiative = (float(randi_range(1, 9))/10)
		
	if Target_Node.Spawned == true:
		await get_tree().create_timer((1.5 * Base_Initiative) + 0.5).timeout
		get_node("Sprite").show()
	
		print(name, " readied with initiative of ", Base_Initiative)


func _on_character_action(target: TurnBasedAgent, attack: Resource):
	
	_animation_example(target)
#everything below this to be deleted once proper animations are implimented
func _input(event: InputEvent):
	
	var targ2et = get_tree().get_first_node_in_group("Player")
	
	
	if event.is_action_pressed("murdertest"):
		_animation_example(targ2et)

func _animation_example(target):
	
	#var running = true
	
	var Starting_Position = global_position
	var Target_Position = target.get_global_position()
	
	if Target_Node.Spawned == true:
		if not get_node("TargetNode").is_in_group("Player"):
			var theorbofpain = get_node("TargetNode").get_node("orbofpain")
			var animsprite = get_node("Sprite")
			animsprite.play("murderorbshoot")
			await get_tree().create_timer(0.5).timeout
	
			theorbofpain.show()
			var murdertween = get_tree().create_tween()
			murdertween.tween_property(theorbofpain, "global_position", Target_Position, (0.35 * (1 + Base_Initiative)))
			murdertween.tween_property(theorbofpain, "global_position", Starting_Position, (0.35 * (1 + Base_Initiative)))
		
			await get_tree().create_timer(0.35 * (1 + Base_Initiative)).timeout
			theorbofpain.hide()
		
			await murdertween.finished
		#running = false
		
	#Target_Node.command_done()
