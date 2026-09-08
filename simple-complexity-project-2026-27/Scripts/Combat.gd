extends Control

var Cphase = 0

func _ready() -> void:
	set_player_health()			#Sets the player health at the start of combat to actually equal the players actual health 
	Cphase = 1
func set_player_health():
	$ProgressBar.value = State.Health 
	$ProgressBar.max_value = State.Max_Health
	$ProgressBar/Label.text = "HP:%d/%d" % [State.Health, State.Max_Health]

func set_enemy_health():
	$Enemy_Container/ProgressBar/Label.text = "HP:%d/%d" % [$Enemy_Container/ProgressBar.value, $Enemy_Container/ProgressBar.max_value]
	
func _on_action_1_pressed() -> void:
	if Cphase == 1:
		$Enemy_Container/ProgressBar.value -= 1 
		set_enemy_health()
		Cphase = 2
	else:
		pass


func _on_action_2_pressed() -> void:
	if Cphase == 1:
		$Enemy_Container/ProgressBar.value -= 2 
		set_enemy_health()
		Cphase = 2
	else:
		pass


func _on_action_3_pressed() -> void:
	if Cphase == 1:
		$Enemy_Container/ProgressBar.value -= 3 
		set_enemy_health()
		Cphase = 2
	else:
		pass
