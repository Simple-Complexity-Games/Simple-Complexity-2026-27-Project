extends Control

@export var Cphase = 0
@export var Enemy_health = 0
@export var Enemy_max_health = 0
@export var Enemy2_health = 0
@export var Enemy2_max_health = 0
@export var Enemy3_health = 0
@export var Enemy3_max_health = 0



func _ready() -> void:
	set_health($ProgressBar , State.Health , State.Max_Health)			#Sets the player health at the start of combat to actually equal the players actual health 
	Enemy_health = 
	Enemy_max_health = 
	set_health($Enemy_Container/ProgressBar , Enemy_health , Enemy_max_health)
	Cphase = 1
	
	
func set_health(progressbar , health , max_health):
	progressbar.value = health 
	
	progressbar.max_value = max_health
	
	progressbar.get_node("Label").text = "HP:%d/%d" % [health, max_health]


func _on_action_1_pressed() -> void:
	if Cphase == 1:
		Enemy_health -= 1
		set_health($Enemy_Container/ProgressBar , Enemy_health , Enemy_max_health)
		Cphase = 1
	else:
		pass


func _on_action_2_pressed() -> void:
	if Cphase == 1:
		set_health($Enemy_Container/ProgressBar , Enemy_health - 2 , Enemy_max_health)
		Cphase = 1
	else:
		pass


func _on_action_3_pressed() -> void:
	if Cphase == 1:
		set_health($Enemy_Container/ProgressBar , Enemy_health - 3 , Enemy_max_health)
		Cphase = 2
	else:
		pass
