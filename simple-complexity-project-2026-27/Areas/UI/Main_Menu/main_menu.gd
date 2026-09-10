extends Control

#region ------@onready Node Definitions------
#var GameManager = load("res://scripts/game manager.gd")

# General scene nodes
@onready var Music_Player = get_node("Music_Player")
@onready var Hover_SFX_Player = get_node("Hover_SFX_Player")
# Main Menu
@onready var Main_Menu_Label = get_node("Title_Label")
@onready var Main_Menu_Container = get_node("Main_Menu_Container")
@onready var Start_Button = get_node("Main_Menu_Container/Start_Button")
@onready var Options_Button = get_node("Main_Menu_Container/Options_Button")
@onready var Quit_Button = get_node("Main_Menu_Container/Quit_Button")
@onready var Reset_Demo_Button = get_node("Main_Menu_Container/Reset_Demo_Button")
# Options Menu
@onready var Options_Menu_Label = get_node("Options_Menu_Label")
@onready var Options_Menu_Container = get_node("Options_Menu_Container")
@onready var Controls_Button = get_node("Options_Menu_Container/Controls_Button")
@onready var Audio_Button = get_node("Options_Menu_Container/Audio_Button")
@onready var Video_Button = get_node("Options_Menu_Container/Video_Button")
@onready var Options_Done_Button = get_node("Options_Menu_Container/Options_Done_Button")
# Controls Menu
@onready var Controls_Menu_Container = get_node("Controls_Menu_Container")
@onready var Left_Bind_Button = get_node("Controls_Menu_Container/GridContainer/Left_Bind_Button")
@onready var Left_Unbind_Button = get_node("Controls_Menu_Container/GridContainer/Left_Bind_Button/Left_Unbind_Button")
@onready var Left_Bind_1 = get_node("Controls_Menu_Container/GridContainer/Left_Bind_Button/Left_Container/Left_Bind_1")
@onready var Left_Bind_2 = get_node("Controls_Menu_Container/GridContainer/Left_Bind_Button/Left_Container/Left_Bind_2")
@onready var Right_Bind_Button = get_node("Controls_Menu_Container/GridContainer/Right_Bind_Button")
@onready var Right_Unbind_Button = get_node("Controls_Menu_Container/GridContainer/Right_Bind_Button/Right_Unbind_Button")
@onready var Right_Bind_1 = get_node("Controls_Menu_Container/GridContainer/Right_Bind_Button/Right_Container/Right_Bind_1")
@onready var Right_Bind_2 = get_node("Controls_Menu_Container/GridContainer/Right_Bind_Button/Right_Container/Right_Bind_2")
@onready var Up_Bind_Button = get_node("Controls_Menu_Container/GridContainer/Up_Bind_Button")
@onready var Up_Unbind_Button = get_node("Controls_Menu_Container/GridContainer/Up_Bind_Button/Up_Unbind_Button")
@onready var Up_Bind_1 = get_node("Controls_Menu_Container/GridContainer/Up_Bind_Button/Up_Container/Up_Bind_1")
@onready var Up_Bind_2 = get_node("Controls_Menu_Container/GridContainer/Up_Bind_Button/Up_Container/Up_Bind_2")
@onready var Down_Bind_Button = get_node("Controls_Menu_Container/GridContainer/Down_Bind_Button")
@onready var Down_Unbind_Button = get_node("Controls_Menu_Container/GridContainer/Down_Bind_Button/Down_Unbind_Button")
@onready var Down_Bind_1 = get_node("Controls_Menu_Container/GridContainer/Down_Bind_Button/Down_Container/Down_Bind_1")
@onready var Down_Bind_2 = get_node("Controls_Menu_Container/GridContainer/Down_Bind_Button/Down_Container/Down_Bind_2")
@onready var Jump_Bind_Button = get_node("Controls_Menu_Container/GridContainer/Jump_Bind_Button")
@onready var Jump_Unbind_Button = get_node("Controls_Menu_Container/GridContainer/Jump_Bind_Button/Jump_Unbind_Button")
@onready var Jump_Bind_1 = get_node("Controls_Menu_Container/GridContainer/Jump_Bind_Button/Jump_Container/Jump_Bind_1")
@onready var Jump_Bind_2 = get_node("Controls_Menu_Container/GridContainer/Jump_Bind_Button/Jump_Container/Jump_Bind_2")
@onready var Glide_Bind_Button = get_node("Controls_Menu_Container/GridContainer/Glide_Bind_Button")
@onready var Glide_Unbind_Button = get_node("Controls_Menu_Container/GridContainer/Glide_Bind_Button/Glide_Unbind_Button")
@onready var Glide_Bind_1 = get_node("Controls_Menu_Container/GridContainer/Glide_Bind_Button/Glide_Container/Glide_Bind_1")
@onready var Glide_Bind_2 = get_node("Controls_Menu_Container/GridContainer/Glide_Bind_Button/Glide_Container/Glide_Bind_2")
@onready var Controls_Done_Button = get_node("Controls_Menu_Container/Controls_Done_Button")
# Audio Menu
@onready var Audio_Menu_Label = get_node("Audio_Menu_Label")
@onready var Audio_Menu_Container = get_node("Audio_Menu_Container")
@onready var Master_Volume_Slider = get_node("Audio_Menu_Container/Master_Volume_Slider")
@onready var Music_Volume_Slider = get_node("Audio_Menu_Container/Music_Volume_Slider")
@onready var SFX_Volume_Slider = get_node("Audio_Menu_Container/SFX_Volume_Slider")
@onready var Audio_Done_Button = get_node("Audio_Menu_Container/Audio_Done_Button")
# Video Menu
@onready var Video_Menu_Label = get_node("Video_Menu_Label")
@onready var Video_Menu_Container = get_node("Video_Menu_Container")
@onready var Video_Brightness_Slider = get_node("Video_Menu_Container/Brightness_Slider")
@onready var Video_Contrast_Slider = get_node("Video_Menu_Container/Contrast_Slider")
@onready var Video_Saturation_Slider = get_node("Video_Menu_Container/Saturation_Slider")
@onready var Window_Mode_Button = get_node("Video_Menu_Container/Window_Mode_Button")
@onready var Screen_Shake_Button = get_node("Video_Menu_Container/Screen_Shake_Button")
@onready var Screen_Blur_Button = get_node("Video_Menu_Container/Screen_Blur_Button")
@onready var Video_Done_Button = get_node("Video_Menu_Container/Video_Done_Button")
@onready var World_Environment = get_node("WorldEnvironment")
#endregion

#region ------File Path and File Name Definitions------
# Button icon folder
var button_icon_folder_path = "res://assets/Art/Button_Icons/Keyboard_And_Mouse/Dark/"
# Unrecognized keybind texture paths
var blank_button_icon_folder_path = "res://assets/Art/Button_Icons/Keyboard_And_Mouse/Blanks/"
var blank_key_texture_name = "Blank_Black_Normal.png"
var blank_mouse_texture_name = "Blank_Black_Mouse.png"
#endregion

#region ------Keybinding Dictionary Definitions------
# Dictionaries to get an icon node during rebinding using the action_to_be_rebound var, not populated
# here due to needing to contain onready vars, which can only be referenced after the start of _ready():
var Rebind_Action_To_Primary_Icon_Node_Dict = {}
var Rebind_Action_To_Secondary_Icon_Node_Dict = {}

# Unfortunately we don't really have the time to implement a way to show the chirality (handedness) of 
# duplicate keys (shift, ctrl, alt, etc.). This is implemented in code, with a distinction between left 
# and right versions of keys do to key codes being different, but the icons will just not reflect that 
# because the icon pack does not contain icons for separate chiral keys and it would be too time 
# consuming to add an extra indicator to the UI
var Keycode_To_Button_Icon_File_Name_Dict = {
	8:"Backspace_Key_Dark.png", 
	9:"Tab_Key_Dark.png", 
	13:"Enter_Key_Dark.png", 
	16:"Shift_Key_Dark.png",
	17:"Ctrl_Key_Dark.png",
	18:"Alt_Key_Dark.png",
	20:"Caps_Lock_Key_Dark.png",
	27:"Esc_Key_Dark.png",
	32:"Space_Key_Dark.png",
	33:"Page_Up_Key_Dark.png",
	34:"Page_Down_Key_Dark.png",
	35:"End_Key_Dark.png",
	36:"Home_Key_Dark.png",
	37:"Arrow_Left_Key_Dark.png",
	38:"Up_Arrow_Key_Dark.png",
	39:"Quote_Key_Dark.png",
	40:"Arrow_Down_Key_Dark.png",
	44:"Mark_Left_Key_Dark.png",
	45:"Minus_Key_Dark.png",
	46:"Mark_Right_Key_Dark.png",
	47:"Question_Key_Dark.png",
	48:"0_Key_Dark.png", 
	49:"1_Key_Dark.png", 
	50:"2_Key_Dark.png", 
	51:"3_Key_Dark.png", 
	52:"4_Key_Dark.png", 
	53:"5_Key_Dark.png", 
	54:"6_Key_Dark.png", 
	55:"7_Key_Dark.png", 
	56:"8_Key_Dark.png", 
	57:"9_Key_Dark.png", 
	59:"Semicolon_Key_Dark.png",
	61:"Plus_Key_Dark.png",
	65:"A_Key_Dark.png",
	66:"B_Key_Dark.png",
	67:"C_Key_Dark.png",
	68:"D_Key_Dark.png",
	69:"E_Key_Dark.png",
	70:"F_Key_Dark.png",
	71:"G_Key_Dark.png",
	72:"H_Key_Dark.png",
	73:"I_Key_Dark.png",
	74:"J_Key_Dark.png",
	75:"K_Key_Dark.png",
	76:"L_Key_Dark.png",
	77:"M_Key_Dark.png",
	78:"N_Key_Dark.png",
	79:"O_Key_Dark.png",
	80:"P_Key_Dark.png",
	81:"Q_Key_Dark.png",
	82:"R_Key_Dark.png",
	83:"S_Key_Dark.png",
	84:"T_Key_Dark.png",
	85:"U_Key_Dark.png",
	86:"V_Key_Dark.png",
	87:"W_Key_Dark.png",
	88:"X_Key_Dark.png",
	89:"Y_Key_Dark.png",
	90:"Z_Key_Dark.png",
	91:"Bracket_Left_Key_Dark.png",
	92:"Slash_Key_Dark.png",
	93:"Bracket_Right_Key_Dark.png",
	96:"Tilda_Key_Dark.png",
	97:"1_Key_Dark.png",
	98:"2_Key_Dark.png",
	99:"3_Key_Dark.png",
	100:"4_Key_Dark.png",
	101:"5_Key_Dark.png",
	102:"6_Key_Dark.png",
	103:"7_Key_Dark.png",
	104:"8_Key_Dark.png",
	105:"9_Key_Dark.png",
	107:"Plus_Key_Dark.png",
	109:"Minus_Key_Dark.png",
	110:"Mark_Right_Key_Dark.png",
	111:"Slash_Key_Dark.png",
	112:"F1_Key_Dark.png",
	113:"F2_Key_Dark.png",
	114:"F3_Key_Dark.png",
	115:"F4_Key_Dark.png",
	116:"F5_Key_Dark.png",
	117:"F6_Key_Dark.png",
	118:"F7_Key_Dark.png",
	119:"F8_Key_Dark.png",
	120:"F9_Key_Dark.png",
	121:"F10_Key_Dark.png",
	122:"F11_Key_Dark.png",
	123:"F12_Key_Dark.png",
	144:"Num_Lock_Key_Dark.png",
	160:"Shift_Key_Dark.png", 
	161:"Shift_Key_Dark.png", 
	162:"Ctrl_Key_Dark.png", 
	163:"Ctrl_Key_Dark.png", 
	164:"Alt_Key_Dark.png", 
	165:"Alt_Key_Dark.png",
	4194306:"Tab_Key_Dark.png",
	4194310:"Enter_Tall_Key_Dark.png",
	4194311:"Insert_Key_Dark.png",
	4194312:"Del_Key_Dark.png",
	4194317:"Home_Key_Dark.png",
	4194318:"End_Key_Dark.png",
	4194319:"Arrow_Left_Key_Dark.png",
	4194320:"Arrow_Up_Key_Dark.png",
	4194321:"Arrow_Right_Key_Dark.png",
	4194322:"Arrow_Down_Key_Dark.png",
	4194323:"Page_Up_Key_dark.png",
	4194324:"Page_Down_Key_Dark.png",
	4194325:"Shift_Key_Dark.png",
	4194326:"Ctrl_Key_Dark.png",
	4194327:"Win_Key_Dark.png",
	4194328:"Alt_Key_Dark.png",
	4194329:"Caps_Lock_Key_Dark.png",
	4194330:"Num_Lock_Key_Dark.png",
	4194438:"0_Key_Dark.png",
	}

var Mouse_Index_To_Button_Icon_File_Name_Dict = {
	1:"Mouse_Left_Key_Dark.png",
	2:"Mouse_Right_Key_Dark.png",
	3:"Mouse_Middle_Key_Dark.png",
}
#endregion

#region ------Window Mode Var Definitions------
# Window mode button dictionary for relating indexes and window modes
var Window_Mode_Index_Dict = {0:DisplayServer.WINDOW_MODE_FULLSCREEN, 
1:DisplayServer.WINDOW_MODE_MAXIMIZED, 2:DisplayServer.WINDOW_MODE_WINDOWED}
var Button_To_WindowMode_Index_Dict = {0:3, 1:2, 2:0}
var unsupported_window_modes = [DisplayServer.WINDOW_MODE_MINIMIZED, DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN]

var previous_window_mode = DisplayServer.WINDOW_MODE_MAXIMIZED
var previous_window_size = Vector2()
#endregion

#region ------General & Status Var Definitions------
# Rebinding status vars
var start_rebinding = false
var rebinding = false
var action_to_be_rebound: String

# Config and saving vars
var config = ConfigFile.new()
var autosave_timer = null

# Mouse hiding and warping vars
var mouse_hide_position = Vector2(0, 0)
var last_mouse_hover_position = Vector2(0, 0)
var mouse_filters = []
var warp_timer
var warping = false
var keyboard_navigation_mode = false

# Keyboard navigation vars
var focus_owner
var dragging_slider = null
var slider_drag_step_timer
var action_hold_count = 1.05
var left_right_balance
var hovered_window_mode_button_item
var in_popup_menu
var config_update_cooldown_timer
#endregion


func _ready() -> void:
	# This dict has to be defined in _ready() because it contains @onready vars which are not loaded until then
	Rebind_Action_To_Primary_Icon_Node_Dict = {"Left":Left_Bind_1, "Right":Right_Bind_1, 
	"Up":Up_Bind_1, "Down":Down_Bind_1, "Jump":Jump_Bind_1, "Glide":Glide_Bind_1}
	Rebind_Action_To_Secondary_Icon_Node_Dict = {"Left":Left_Bind_2, "Right":Right_Bind_2, 
	"Up":Up_Bind_2, "Down":Down_Bind_2, "Jump":Jump_Bind_2, "Glide":Glide_Bind_2}
	
	warp_timer = get_tree().create_timer(0.0, false, true)
	slider_drag_step_timer = get_tree().create_timer(0.0, true, true)
	config_update_cooldown_timer = get_tree().create_timer(0.01, true, false)
	
	
	Load_Main_Menu()
	
	if !FileAccess.file_exists("user://config"):
		Create_Config(config)
		Save_Config(config)
		Apply_Config(config)
	else:
		config.load("user://config")
		Apply_Config(config)
	
	previous_window_size = DisplayServer.window_get_size()
	
	# Make sure focus owner is defined
	var focus_owner = get_viewport().gui_get_focus_owner()
	
	get_node("Video_Menu_Container/Window_Mode_Button").get_popup().canvas_item_default_texture_filter = TEXTURE_FILTER_NEAREST

func _process(_delta) -> void:
	if Music_Player.playing == false:
		Music_Player.playing = true
	
	if Input.is_action_just_pressed("Escape"):
		keyboard_navigation_mode = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		Set_Hoverable_Control_Mouse_Filters_To_List(mouse_filters)
		InputMap.action_erase_events("ui_up")
		InputMap.action_erase_events("ui_down")
	
	if Input.get_last_mouse_velocity().length() == 0:
		last_mouse_hover_position = get_viewport().get_mouse_position()
	if warping:
		Set_Hoverable_Control_Mouse_Filters_To(2, mouse_filters, true)
	if keyboard_navigation_mode:
		warp_timer = get_tree().create_timer(0.5, false, true)
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
		mouse_hide_position = get_viewport().get_mouse_position()
		Input.warp_mouse(Vector2(0, 0))
		get_viewport().warp_mouse(mouse_hide_position)
	if in_popup_menu:
		if Input.get_last_mouse_velocity().length() > 5 and keyboard_navigation_mode:
			var event = InputEventMouseMotion.new()
			event.set_relative(Vector2(50, 50))
			_input(event)
	
	# Allow keyboard / controller navigation, and hide mouse pointer and hover effects when in keyboard mode by setting all mouse filters to pass
	if Input.is_action_just_pressed("Left"):
		# Mouse hiding
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			keyboard_navigation_mode = true
			warping = true
		
		action_hold_count = 1
	elif Input.is_action_just_pressed("Right"):
		# Mouse hiding
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			keyboard_navigation_mode = true
			warping = true
		
		action_hold_count = 1
	elif Input.is_action_just_pressed("Up"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			keyboard_navigation_mode = true
			warping = true
		# Keyboard mode menu navigation
		var above_focused_control = get_viewport().gui_get_focus_owner().get_node_or_null(get_viewport().gui_get_focus_owner().focus_neighbor_top)
		if in_popup_menu:
			pass
		elif above_focused_control:
			above_focused_control.grab_focus()
	elif Input.is_action_just_pressed("Down"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			keyboard_navigation_mode = true
			warping = true
		# Keyboard mode menu navigation
		var below_focused_control = get_viewport().gui_get_focus_owner().get_node_or_null(get_viewport().gui_get_focus_owner().focus_neighbor_bottom)
		if in_popup_menu:
			pass
		elif below_focused_control:
			below_focused_control.grab_focus()
	elif Input.is_action_just_pressed("Jump"):
		if focus_owner is not OptionButton and Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			keyboard_navigation_mode = true
			warping = true
		# Handle menu interactions with the select / jump action in keyboard mode
		focus_owner = get_viewport().gui_get_focus_owner()
		if focus_owner is OptionButton:
			# Show the OptionButton popup menu and bind ui_up and ui_down actions to allow the hovered item
			# in the OptionButton to be changed. It's jank but works.
			if focus_owner.get_popup().visible == false and not in_popup_menu:
				focus_owner.show_popup()
				if InputMap.action_get_events("Up").size() > 0:
					InputMap.action_add_event("ui_up", InputMap.action_get_events("Up")[0])
				if InputMap.action_get_events("Up").size() > 1:
					InputMap.action_add_event("ui_up", InputMap.action_get_events("Up")[1])
				if InputMap.action_get_events("Down").size() > 0:
					InputMap.action_add_event("ui_down", InputMap.action_get_events("Down")[0])
				if InputMap.action_get_events("Down").size() > 1:
					InputMap.action_add_event("ui_down", InputMap.action_get_events("Down")[1])
				focus_owner.get_popup().grab_focus()
				hovered_window_mode_button_item = focus_owner.selected
				in_popup_menu = true
			# Hide the OptionButton popup menu and unbind ui_up and ui_down actions to return to normal
			# keyboard mode navigation and select the hovered item as the new window mode
			elif focus_owner.get_popup().visible == true:
				if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
					var focused_item = focus_owner.get_popup().get_focused_item()
					focus_owner.select(focused_item)
					_on_window_mode_button_item_selected(focused_item)
					
					await get_tree().process_frame
					
					mouse_hide_position = get_viewport().get_mouse_position()
					keyboard_navigation_mode = true
					warping = true
					InputMap.action_erase_events("ui_up")
					InputMap.action_erase_events("ui_down")
				else:
					focus_owner.get_popup().visible = false
					focus_owner.select(hovered_window_mode_button_item)
					_on_window_mode_button_item_selected(hovered_window_mode_button_item)
					in_popup_menu = false
					InputMap.action_erase_events("ui_up")
					InputMap.action_erase_events("ui_down")
		elif focus_owner.get("pressed") != null:
			focus_owner.button_down.emit()
	if Input.is_action_just_pressed("ui_up"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			keyboard_navigation_mode = true
			warping = true
		if focus_owner is OptionButton and focus_owner.get_popup().visible:
			if hovered_window_mode_button_item == 2:
				in_popup_menu = false
				focus_owner.get_popup().hide()
				InputMap.action_erase_events("ui_up")
				InputMap.action_erase_events("ui_down")
	if Input.is_action_just_pressed("ui_down"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			keyboard_navigation_mode = true
			warping = true
		
		if focus_owner is OptionButton and focus_owner.get_popup().visible:
			focus_owner.button_pressed = false
	
	# Handle menu actions to be taken continuously with button input
	left_right_balance = Input.get_axis("Left", "Right")
	action_hold_count += 1.1
	if focus_owner is HSlider:
		dragging_slider = focus_owner
	if left_right_balance < 0 and slider_drag_step_timer.time_left == 0:
		slider_drag_step_timer = get_tree().create_timer(0.4 / action_hold_count, true, true)
		
		var left_of_focused_control = get_viewport().gui_get_focus_owner().get_node_or_null(get_viewport().gui_get_focus_owner().get("focus_neighbor_left"))
		if left_of_focused_control != null:
			left_of_focused_control.grab_focus()
		
		focus_owner = get_viewport().gui_get_focus_owner()
		if focus_owner is HSlider:
			if (focus_owner.value + focus_owner.step) >= focus_owner.min_value and left_right_balance < 0:
				focus_owner.value -= focus_owner.step
	if left_right_balance > 0 and slider_drag_step_timer.time_left == 0:
		slider_drag_step_timer = get_tree().create_timer(0.4 / action_hold_count, true, true)
		
		var right_of_focused_control = get_viewport().gui_get_focus_owner().get_node_or_null(get_viewport().gui_get_focus_owner().get("focus_neighbor_right"))
		if right_of_focused_control != null:
			right_of_focused_control.grab_focus()
		
		focus_owner = get_viewport().gui_get_focus_owner()
		if focus_owner is HSlider:
			if (focus_owner.value + focus_owner.step) <= focus_owner.max_value:
				focus_owner.value += focus_owner.step
	if Input.is_action_just_released("Left") or Input.is_action_just_released("Right"):
		slider_drag_step_timer.time_left = 0.0
		action_hold_count = 8
	
	if Input.is_action_just_pressed("Escape"):
		_on_window_mode_button_item_selected(Button_To_WindowMode_Index_Dict.find_key(DisplayServer.window_get_mode()))
		if InputMap.action_get_events("ui_up").size() > 0:
			Apply_Config(config)
			InputMap.action_erase_events("ui_up")
			InputMap.action_erase_events("ui_down")
		if Options_Menu_Container.visible == false and Main_Menu_Container.visible == false:
			Load_Options_Menu()
		elif Options_Menu_Container.visible == true:
			Load_Main_Menu()
	if Input.is_action_just_pressed("Fullscreen"):
		if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
			if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
				Save_Window_Size(DisplayServer.window_get_size().x, DisplayServer.window_get_size().y)
				Save_Window_Position(DisplayServer.window_get_position().x, DisplayServer.window_get_position().y)
			previous_window_mode = DisplayServer.window_get_mode()
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			Window_Mode_Button.selected = Window_Mode_Index_Dict.find_key(DisplayServer.WINDOW_MODE_FULLSCREEN)
			Change_Override_Config("display/window/size/mode", DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(previous_window_mode)
			DisplayServer.window_set_size(Vector2(float(ProjectSettings.get_setting_with_override("display/window/size/window_width_override")), float(ProjectSettings.get_setting_with_override("display/window/size/window_height_override"))))
			#DisplayServer.window_set_position(ProjectSettings.get_setting_with_override("display/window/size/initial_position"))
			if Window_Mode_Index_Dict.has(previous_window_mode):
				Window_Mode_Button.selected = Window_Mode_Index_Dict.find_key(previous_window_mode)
				Change_Override_Config("display/window/size/mode", previous_window_mode)
	
	if DisplayServer.window_get_mode() != previous_window_mode and DisplayServer.window_get_mode() not in unsupported_window_modes and DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
		Window_Mode_Button.selected = Window_Mode_Index_Dict.find_key(DisplayServer.window_get_mode())
		Change_Override_Config("display/window/size/mode", DisplayServer.window_get_mode())
		previous_window_mode = DisplayServer.window_get_mode()
	
	# Autosave functionality logic
	if autosave_timer == null:
		autosave_timer = get_tree().create_timer(180, false, true)
	elif autosave_timer.time_left <= 0:
		Save_Config(config)
		autosave_timer = get_tree().create_timer(180, false, true)

func Set_Hoverable_Control_Mouse_Filters_To(value, old_filter_list = mouse_filters, record_old_filters = false):
	for control in get_tree().get_nodes_in_group("Hoverable"):
		var control_mouse_filter = control.get("mouse_filter")
		if control_mouse_filter != null:
			if record_old_filters == true:
				old_filter_list.append(control_mouse_filter)
			control.mouse_filter = value
	warping = false

func Set_Hoverable_Control_Mouse_Filters_To_List(mouse_filter_list):
	var index = 0
	for control in get_tree().get_nodes_in_group("Hoverable"):
		if index > 0 and index < mouse_filter_list.size():
			control.mouse_filter = mouse_filter_list[index]
		index += 1

#region ------Main Menu Functions------
# Start button
func _on_start_button_mouse_entered() -> void:
	Hover_SFX_Player.playing = true
	Start_Button.grab_focus()
func _on_start_button_button_down() -> void:
	Start_Game()
# Options button
func _on_options_button_mouse_entered() -> void:
	Hover_SFX_Player.playing = true
	Options_Button.grab_focus()
func _on_options_button_button_down() -> void:
	Load_Options_Menu()
# Quit button
func _on_quit_button_mouse_entered() -> void:
	Hover_SFX_Player.playing = true
	Quit_Button.grab_focus()
func _on_quit_button_button_down() -> void:
	get_tree().quit()
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		Save_Window_Size(DisplayServer.window_get_size().x, DisplayServer.window_get_size().y)

func _on_reset_demo_button_mouse_entered() -> void:
	Hover_SFX_Player.playing = true
	Reset_Demo_Button.grab_focus()
func _on_reset_demo_button_button_down() -> void:
	Hover_SFX_Player.playing = true
	
	var dir_access = DirAccess.open("user://")
	if FileAccess.file_exists("user://fox_killed.txt"):
		dir_access.remove("user://fox_killed.txt")
	if FileAccess.file_exists("user://fox_spawned.txt"):
		dir_access.remove("user://fox_spawned.txt")
	Create_Config(config)
	Save_Config(config)
	Apply_Config(config)
#endregion

#region ------Options Menu Functions------
# Controls button
func _on_controls_button_mouse_entered() -> void:
	Hover_SFX_Player.playing = true
	Controls_Button.grab_focus()
func _on_controls_button_button_down() -> void:
	Load_Controls_Menu()
# Audio button
func _on_audio_button_mouse_entered() -> void:
	Hover_SFX_Player.playing = true
	Audio_Button.grab_focus()
func _on_audio_button_button_down() -> void:
	Load_Audio_Menu()
# Video button
func _on_video_button_mouse_entered() -> void:
	Hover_SFX_Player.playing = true
	Video_Button.grab_focus()
func _on_video_button_button_down() -> void:
	Load_Video_Menu()
# Done button
func _on_options_done_button_mouse_entered() -> void:
	Hover_SFX_Player.playing = true
	Options_Done_Button.grab_focus()
func _on_options_done_button_button_down() -> void:
	Save_Config(config)
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		Save_Window_Size(DisplayServer.window_get_size().x, DisplayServer.window_get_size().y)
	Load_Main_Menu()
#endregion

#region ------Controls Menu Functions------
# Left action rebind button
func _on_left_bind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Left_Bind_Button.grab_focus()
func _on_left_bind_button_button_down():
	Hover_SFX_Player.playing = true
	start_rebinding = true
	action_to_be_rebound = "Left"
# Left action unbind button
func _on_left_unbind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Left_Unbind_Button.grab_focus()
func _on_left_unbind_button_button_down():
	Hover_SFX_Player.pitch_scale = 0.6
	Hover_SFX_Player.playing = true
	Hover_SFX_Player.pitch_scale = 1
	if Left_Bind_2.texture != null:
		Left_Bind_2.texture = null
		Update_Config("Controls", "Left", "", 1)
	else:
		Left_Bind_1.texture = null
		Update_Config("Controls", "Left", "", 0)
	# Delete end event in events list
	if InputMap.action_get_events("Left").size() > 0:
		var event_to_delete = InputMap.action_get_events("Left")[InputMap.action_get_events("Left").size() - 1]
		InputMap.action_erase_event("Left", event_to_delete)
# Right action rebind button
func _on_right_bind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Right_Bind_Button.grab_focus()
func _on_right_bind_button_button_down():
	Hover_SFX_Player.playing = true
	start_rebinding = true
	action_to_be_rebound = "Right"
# Right action unbind button
func _on_right_unbind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Right_Unbind_Button.grab_focus()
func _on_right_unbind_button_button_down():
	Hover_SFX_Player.pitch_scale = 0.6
	Hover_SFX_Player.playing = true
	Hover_SFX_Player.pitch_scale = 1
	if Right_Bind_2.texture != null:
		Right_Bind_2.texture = null
		Update_Config("Controls", "Right", "", 1)
	else:
		Right_Bind_1.texture = null
		Update_Config("Controls", "Right", "", 0)
	# Delete end event in events list
	if InputMap.action_get_events("Right").size() > 0:
		var event_to_delete = InputMap.action_get_events("Right")[InputMap.action_get_events("Right").size() - 1]
		InputMap.action_erase_event("Right", event_to_delete)
# Up action rebind button
func _on_up_bind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Up_Bind_Button.grab_focus()
func _on_up_bind_button_button_down():
	Hover_SFX_Player.playing = true
	start_rebinding = true
	action_to_be_rebound = "Up"
# Up action unbind button
func _on_up_unbind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Up_Unbind_Button.grab_focus()
func _on_up_unbind_button_button_down():
	Hover_SFX_Player.pitch_scale = 0.6
	Hover_SFX_Player.playing = true
	Hover_SFX_Player.pitch_scale = 1
	if Up_Bind_2.texture != null:
		Up_Bind_2.texture = null
		Update_Config("Controls", "Up", "", 1)
	else:
		Up_Bind_1.texture = null
		Update_Config("Controls", "Up", "", 0)
	# Delete end event in events list
	if InputMap.action_get_events("Up").size() > 0:
		var event_to_delete = InputMap.action_get_events("Up")[InputMap.action_get_events("Up").size() - 1]
		InputMap.action_erase_event("Up", event_to_delete)
# Down action rebind button
func _on_down_bind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Down_Bind_Button.grab_focus()
func _on_down_bind_button_button_down():
	Hover_SFX_Player.playing = true
	start_rebinding = true
	action_to_be_rebound = "Down"
# Down action unbind button
func _on_down_unbind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Down_Unbind_Button.grab_focus()
func _on_down_unbind_button_button_down():
	Hover_SFX_Player.pitch_scale = 0.6
	Hover_SFX_Player.playing = true
	Hover_SFX_Player.pitch_scale = 1
	if Down_Bind_2.texture != null:
		Down_Bind_2.texture = null
		Update_Config("Controls", "Down", "", 1)
	else:
		Down_Bind_1.texture = null
		Update_Config("Controls", "Down", "", 0)
	# Delete end event in events list
	if InputMap.action_get_events("Down").size() > 0:
		var event_to_delete = InputMap.action_get_events("Down")[InputMap.action_get_events("Down").size() - 1]
		InputMap.action_erase_event("Down", event_to_delete)
# Jump action rebind button
func _on_jump_bind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Jump_Bind_Button.grab_focus()
func _on_jump_bind_button_button_down():
	Hover_SFX_Player.playing = true
	start_rebinding = true
	action_to_be_rebound = "Jump"
#Jump action unbind button
func _on_jump_unbind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Jump_Unbind_Button.grab_focus()
func _on_jump_unbind_button_button_down():
	Hover_SFX_Player.pitch_scale = 0.6
	Hover_SFX_Player.playing = true
	Hover_SFX_Player.pitch_scale = 1
	if Jump_Bind_2.texture != null:
		Jump_Bind_2.texture = null
		Update_Config("Controls", "Jump", "", 1)
	else:
		Jump_Bind_1.texture = null
		Update_Config("Controls", "Jump", "", 0)
	# Delete end event in events list
	if InputMap.action_get_events("Jump").size() > 0:
		var event_to_delete = InputMap.action_get_events("Jump")[InputMap.action_get_events("Jump").size() - 1]
		InputMap.action_erase_event("Jump", event_to_delete)
# Glide action rebind button
func _on_glide_bind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Glide_Bind_Button.grab_focus()
func _on_glide_bind_button_button_down():
	Hover_SFX_Player.playing = true
	start_rebinding = true
	action_to_be_rebound = "Glide"
# Glide action unbind button
func _on_glide_unbind_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Glide_Unbind_Button.grab_focus()
func _on_glide_unbind_button_button_down():
	Hover_SFX_Player.pitch_scale = 0.6
	Hover_SFX_Player.playing = true
	Hover_SFX_Player.pitch_scale = 1
	if Glide_Bind_2.texture != null:
		Glide_Bind_2.texture = null
		Update_Config("Controls", "Glide", "", 1)
	else:
		Glide_Bind_1.texture = null
		Update_Config("Controls", "Glide", "", 0)
	# Delete end event in events list
	if InputMap.action_get_events("Glide").size() > 0:
		var event_to_delete = InputMap.action_get_events("Glide")[InputMap.action_get_events("Glide").size() - 1]
		InputMap.action_erase_event("Glide", event_to_delete)
# Done button 
func _on_controls_done_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Controls_Done_Button.grab_focus()
func _on_controls_done_button_button_down():
	Save_Config(config)
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		Save_Window_Size(DisplayServer.window_get_size().x, DisplayServer.window_get_size().y)
	Load_Options_Menu()

# _input() - This function is used for listening for the rebind key when a rebinding sequence is initiated
func _input(event):
	if event is InputEventMouseButton and focus_owner is OptionButton:
		if focus_owner.get_popup().visible == true:
			InputMap.action_erase_events("ui_up")
			InputMap.action_erase_events("ui_down")
	
	# Only rebind controls if the rebinding flag has been set to true
	if rebinding and event.is_action_type() and !event.is_echo() and event.is_pressed():
		if event is InputEventMouseButton:
			# Set the secondary rebind slot icon to the primary slot's old image to make room for the new bind
			Rebind_Action_To_Secondary_Icon_Node_Dict.get(action_to_be_rebound).texture = Rebind_Action_To_Primary_Icon_Node_Dict.get(action_to_be_rebound).texture
			# Erase event corresponding to oldest rebind slot (second slot) since only two can be bound at once
			var secondary_keybind_event = InputEventKey.new()
			secondary_keybind_event.set_keycode(int(config.get_value("Controls", action_to_be_rebound)[1].substr(1)))
			InputMap.action_erase_event(action_to_be_rebound, secondary_keybind_event)
			# Actually update the binds list in the config file
			Update_Config("Controls", action_to_be_rebound, Get_Config("Controls", action_to_be_rebound, 0), 1)
			Update_Config("Controls", action_to_be_rebound, "m"+str(event.button_index), 0)
			# Add the binding to the InputMap
			InputMap.action_add_event(action_to_be_rebound, event)
			# Search for button icon in reference dict and apply it to the newly rebound slot. If not found, 
			# use blank mouse texture instead
			if Mouse_Index_To_Button_Icon_File_Name_Dict.has(event.button_index):
				Rebind_Action_To_Primary_Icon_Node_Dict.get(action_to_be_rebound).texture = load(button_icon_folder_path+Mouse_Index_To_Button_Icon_File_Name_Dict.get(event.button_index))
			else:
				Rebind_Action_To_Primary_Icon_Node_Dict.get(action_to_be_rebound).texture = load(blank_button_icon_folder_path+blank_key_texture_name)
			rebinding = false
		elif event is InputEventKey:
			# Set secondary rebind slot icon to the primary slot's old image to make room for the new bind
			Rebind_Action_To_Secondary_Icon_Node_Dict.get(action_to_be_rebound).texture = Rebind_Action_To_Primary_Icon_Node_Dict.get(action_to_be_rebound).texture
			# Erase event corresponding to oldest rebind slot (second slot) since only two can be bound at once
			var secondary_keybind_event = InputEventKey.new()
			secondary_keybind_event.set_keycode(int(config.get_value("Controls", action_to_be_rebound)[1].substr(1)))
			InputMap.action_erase_event(action_to_be_rebound, secondary_keybind_event)
			# Actually update the binds list in the config file
			Update_Config("Controls", action_to_be_rebound, Get_Config("Controls", action_to_be_rebound, 0), 1)
			Update_Config("Controls", action_to_be_rebound, "k"+str(event.physical_keycode), 0)
			# Add the binding to the InputMap
			InputMap.action_add_event(action_to_be_rebound, event)
			# Search for button icon in reference dict and apply it to the newly rebound slot. If not found, 
			# use blank key texture instead
			if Keycode_To_Button_Icon_File_Name_Dict.has(event.physical_keycode):
				Rebind_Action_To_Primary_Icon_Node_Dict.get(action_to_be_rebound).texture = load(button_icon_folder_path+Keycode_To_Button_Icon_File_Name_Dict.get(event.physical_keycode))
			else:
				Rebind_Action_To_Primary_Icon_Node_Dict.get(action_to_be_rebound).texture = load(blank_button_icon_folder_path+blank_key_texture_name)
			rebinding = false
		# Set the input as handled so it doesn't effect anything else in game
		get_viewport().set_input_as_handled()
		# Set the hsv value of the rebound icon's modulate back to 1 once rebinding is finished
		Rebind_Action_To_Secondary_Icon_Node_Dict.get(action_to_be_rebound).modulate.v = 1
		
	# Ignore the first input when rebinding button is pressed, enabling the next input to be the one bound,
	# otherwise the action will just be rebound to the button pressed to initiate the rebind as even though 
	# that action is handled already by the rebind button this is _input() and it receives all input anyways
	elif start_rebinding: 
		start_rebinding = false
		rebinding = true
		# Grey out action icon to show the rebinding process is active by setting hsv value to 0
		Rebind_Action_To_Secondary_Icon_Node_Dict.get(action_to_be_rebound).modulate.v = 0.5
	
	if event is InputEventMouseButton:
		if keyboard_navigation_mode:
			keyboard_navigation_mode = false
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			Set_Hoverable_Control_Mouse_Filters_To_List(mouse_filters)
			InputMap.action_erase_events("ui_up")
			InputMap.action_erase_events("ui_down")
	if event is InputEventMouseMotion:
		if (
				((last_mouse_hover_position.distance_to(mouse_hide_position) < 50
				and event.relative.length() > 3) or event.relative.length() > 300)
				and keyboard_navigation_mode
		):
			keyboard_navigation_mode = false
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			Set_Hoverable_Control_Mouse_Filters_To_List(mouse_filters)
			InputMap.action_erase_events("ui_up")
			InputMap.action_erase_events("ui_down")
#endregion

#region ------Audio Menu Functions------
# Master volume slider
func _on_master_volume_slider_mouse_entered():
	Hover_SFX_Player.playing = true
	Master_Volume_Slider.grab_focus()
func _on_master_volume_slider_value_changed(value):
	Hover_SFX_Player.playing = true
	AudioServer.set_bus_volume_linear(0, value / 80)
	if config_update_cooldown_timer.time_left <= 0:
		Update_Config("Audio", "Master_Volume", Master_Volume_Slider.value)
		config_update_cooldown_timer = get_tree().create_timer(0.05, true, false)
func _on_master_volume_slider_drag_ended(value_changed):
	if value_changed:
		Update_Config("Audio", "Master_Volume", Master_Volume_Slider.value)
# Music volume slider
func _on_music_volume_slider_mouse_entered():
	Hover_SFX_Player.playing = true
	Music_Volume_Slider.grab_focus()
func _on_music_volume_slider_value_changed(value):
	Hover_SFX_Player.playing = true
	AudioServer.set_bus_volume_linear(1, value / 80)
	if config_update_cooldown_timer.time_left <= 0:
		Update_Config("Audio", "Music_Volume", Music_Volume_Slider.value)
		config_update_cooldown_timer = get_tree().create_timer(0.05, true, false)
func _on_music_volume_slider_drag_ended(value_changed):
	if value_changed:
		Update_Config("Audio", "Music_Volume", Music_Volume_Slider.value)
# SFX volume slider
func _on_sfx_volume_slider_mouse_entered():
	Hover_SFX_Player.playing = true
	SFX_Volume_Slider.grab_focus()
func _on_sfx_volume_slider_value_changed(value):
	Hover_SFX_Player.playing = true
	AudioServer.set_bus_volume_linear(2, value / 80)
	if config_update_cooldown_timer.time_left <= 0:
		Update_Config("Audio", "SFX_Volume", SFX_Volume_Slider.value)
		config_update_cooldown_timer = get_tree().create_timer(0.05, true, false)
func _on_sfx_volume_slider_drag_ended(value_changed):
	if value_changed:
		Update_Config("Audio", "SFX_Volume", SFX_Volume_Slider.value)
# Done button
func _on_audio_done_button_mouse_entered() -> void:
	Hover_SFX_Player.playing = true
	Audio_Done_Button.grab_focus()
func _on_audio_done_button_button_down() -> void:
	Save_Config(config)
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		Save_Window_Size(DisplayServer.window_get_size().x, DisplayServer.window_get_size().y)
	Load_Options_Menu()
#endregion

#region ------Video Menu Functions------
# Brightness slider
func _on_brightness_slider_mouse_entered():
	Hover_SFX_Player.playing = true
	Video_Brightness_Slider.grab_focus()
func _on_brightness_slider_value_changed(value):
	Hover_SFX_Player.playing = true
	World_Environment.environment.adjustment_brightness = value
	if config_update_cooldown_timer.time_left <= 0:
		Update_Config("Video", "Brightness", Video_Brightness_Slider.value)
		config_update_cooldown_timer = get_tree().create_timer(0.05, true, false)
func _on_brightness_slider_drag_ended(value_changed):
	if value_changed:
		Update_Config("Video", "Brightness", Video_Brightness_Slider.value)
# Contrast slider
func _on_contrast_slider_mouse_entered():
	Hover_SFX_Player.playing = true
	Video_Contrast_Slider.grab_focus()
func _on_contrast_slider_value_changed(value):
	World_Environment.environment.adjustment_contrast = value
	Hover_SFX_Player.playing = true
	if config_update_cooldown_timer.time_left <= 0:
		Update_Config("Video", "Contrast", Video_Contrast_Slider.value)
		config_update_cooldown_timer = get_tree().create_timer(0.05, true, false)
func _on_contrast_slider_drag_ended(value_changed):
	if value_changed:
		Update_Config("Video", "Contrast", Video_Contrast_Slider.value)
# Saturation slider
func _on_saturation_slider_mouse_entered():
	Hover_SFX_Player.playing = true
	Video_Saturation_Slider.grab_focus()
func _on_saturation_slider_value_changed(value):
	World_Environment.environment.adjustment_saturation = value
	Hover_SFX_Player.playing = true
	if config_update_cooldown_timer.time_left <= 0:
		Update_Config("Video", "Saturation", Video_Saturation_Slider.value)
		config_update_cooldown_timer = get_tree().create_timer(0.05, true, false)
func _on_saturation_slider_drag_ended(value_changed):
	if value_changed:
		Update_Config("Video", "Saturation", Video_Saturation_Slider.value)
# Screen shake button
func _on_screen_shake_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Screen_Shake_Button.grab_focus()
func _on_screen_shake_button_button_down():
	Update_Config("Video", "Screen_Shake", !config.get_value("Video", "Screen_Shake"))
# Screen blur button
func _on_screen_blur_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Screen_Blur_Button.grab_focus()
func _on_screen_blur_button_button_down():
	Update_Config("Video", "Screen_Blur", !config.get_value("Video", "Screen_Blur"))
# Window mode button
func _on_window_mode_button_mouse_entered():
	Hover_SFX_Player.playing = true
	Window_Mode_Button.grab_focus()
func _on_window_mode_button_button_down():
	if not in_popup_menu:
		in_popup_menu = true
	focus_owner = get_viewport().gui_get_focus_owner()
	if InputMap.action_get_events("Up").size() > 0:
		InputMap.action_add_event("ui_up", InputMap.action_get_events("Up")[0])
	if InputMap.action_get_events("Up").size() > 1:
		InputMap.action_add_event("ui_up", InputMap.action_get_events("Up")[1])
	if InputMap.action_get_events("Down").size() > 0:
		InputMap.action_add_event("ui_down", InputMap.action_get_events("Down")[0])
	if InputMap.action_get_events("Down").size() > 1:
		InputMap.action_add_event("ui_down", InputMap.action_get_events("Down")[1])
func _on_window_mode_button_item_focused(index):
	hovered_window_mode_button_item = index
func _on_window_mode_button_item_selected(index):
	in_popup_menu = false
	focus_owner.get_popup().hide()
	Change_Override_Config("display/window/size/mode", Button_To_WindowMode_Index_Dict.get(index))
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		Save_Window_Size(DisplayServer.window_get_size().x, DisplayServer.window_get_size().y)
		Save_Window_Position(DisplayServer.window_get_position().x, DisplayServer.window_get_position().y)
	DisplayServer.window_set_mode(Window_Mode_Index_Dict.get(index))
	InputMap.action_erase_events("ui_up")
	InputMap.action_erase_events("ui_down")
# Done button
func _on_video_done_button_mouse_entered() -> void:
	Hover_SFX_Player.playing = true
	Video_Done_Button.grab_focus()
func _on_video_done_button_button_down() -> void:
	Save_Config(config)
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		Save_Window_Size(DisplayServer.window_get_size().x, DisplayServer.window_get_size().y)
	Load_Options_Menu()

# Function to save the current window size if in windowed mode to restore when launching or exiting fullscreen
func Save_Window_Size(x = null, y = null):
	Change_Override_Config("display/window/size/window_width_override", x)
	Change_Override_Config("display/window/size/window_height_override", y)

func Save_Window_Position(x = null, y = null):
	var window_position = Vector2()
	
	if x != null:
		window_position.x = x
	else:
		window_position.x = DisplayServer.window_get_position().x
	
	if y != null:
		window_position.y = y
	else:
		window_position.y = DisplayServer.window_get_position().y
#endregion

#region ------Navigation Functions------
func Start_Game():
	#GameManager.set("pos_x", 650)
	#GameManager.set("pos_x", 22)
	get_tree().change_scene_to_file("")

func Load_Main_Menu():
	Start_Button.grab_focus()
	Options_Menu_Container.hide()
	Options_Menu_Label.hide()
	Controls_Menu_Container.hide()
	Audio_Menu_Container.hide()
	Audio_Menu_Label.hide()
	Video_Menu_Container.hide()
	Video_Menu_Label.hide()
	Main_Menu_Container.show()
	Main_Menu_Label.show()

func Load_Options_Menu():
	Options_Done_Button.grab_focus()
	Main_Menu_Container.hide()
	Main_Menu_Label.hide()
	Controls_Menu_Container.hide()
	Audio_Menu_Container.hide()
	Audio_Menu_Label.hide()
	Video_Menu_Container.hide()
	Video_Menu_Label.hide()
	Options_Menu_Container.show()
	Options_Menu_Label.show()

func Load_Controls_Menu():
	Controls_Done_Button.grab_focus()
	Main_Menu_Container.hide()
	Main_Menu_Label.hide()
	Options_Menu_Container.hide()
	Options_Menu_Label.hide()
	Audio_Menu_Container.hide()
	Audio_Menu_Label.hide()
	Video_Menu_Container.hide()
	Video_Menu_Label.hide()
	Controls_Menu_Container.show()

func Load_Audio_Menu():
	Audio_Done_Button.grab_focus()
	Main_Menu_Container.hide()
	Main_Menu_Label.hide()
	Options_Menu_Container.hide()
	Options_Menu_Label.hide()
	Controls_Menu_Container.hide()
	Video_Menu_Container.hide()
	Video_Menu_Label.hide()
	Audio_Menu_Container.show()
	Audio_Menu_Label.show()
	
func Load_Video_Menu():
	Video_Done_Button.grab_focus()
	Main_Menu_Container.hide()
	Main_Menu_Label.hide()
	Options_Menu_Container.hide()
	Options_Menu_Label.hide()
	Controls_Menu_Container.hide()
	Audio_Menu_Container.hide()
	Audio_Menu_Label.hide()
	Video_Menu_Container.show()
	Video_Menu_Label.show()
#endregion

#region ------Config Functions------
func Create_Config(config_file):
	# Set audio default values
	config_file.set_value("Audio", "Master_Volume", 70)
	config_file.set_value("Audio", "Music_Volume", 70)
	config_file.set_value("Audio", "SFX_Volume", 70)
	# Set video default values
	config_file.set_value("Video", "Brightness", 1)
	config_file.set_value("Video", "Contrast", 1)
	config_file.set_value("Video", "Saturation", 1)
	config_file.set_value("Video", "Window_Mode", 0)
	config_file.set_value("Video", "Screen_Shake", false)
	config_file.set_value("Video", "Screen_Blur", false)
	# Set default keybind values (wasd and zxc)
	config_file.set_value("Controls", "Left", ["k65", "k4194319"])
	config_file.set_value("Controls", "Right", ["k68", "k4194321"])
	config_file.set_value("Controls", "Up", ["k87", "k4194320"])
	config_file.set_value("Controls", "Down", ["k83", "k4194322"])
	config_file.set_value("Controls", "Jump", ["k32", "k67"])
	config_file.set_value("Controls", "Glide", ["k4194325", "k90"])
	
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		Save_Window_Size(960, 540)

func Get_Config(section, key, index = null):
	if index != null:
		var list = config.get_value(section, key)
		return list[index]
	else:
		return config.get_value(section, key)

func Update_Config(section, key, value, index = null):
	if index != null:
		var list = config.get_value(section, key)
		list[index] = value
		config.set_value(section, key, list)
	else:
		config.set_value(section, key, value)

func Change_Override_Config(setting_path, value):
	ProjectSettings.set_setting(setting_path, value)
	ProjectSettings.save_custom("override.cfg")

func Save_Config(config_file):
	config_file.save("user://config")

func Apply_Config(config_file):
	#region <> Controls settings
	for section_key in config_file.get_section_keys("Controls"):
		var bind_list = config_file.get_value("Controls", section_key)
		# Erase all input events to make room for loading those from the config file
		InputMap.action_erase_events(section_key)
		
		if bind_list[0] != "":
			# Load the button icons for the bind codes in the config file to the primary rebind slot, adapting 
			# to different input methods depending on the first letter of the bind code
			var primary_rebind_slot_icon
			if bind_list[0][0] == "m":
				# If the mouse index is in the icon dictionary, load that icon. If not, load the blank key icon
				# Use string slicing to get the numbers of the bind code, then convert it to an int for the dict
				var icon_file_name = Mouse_Index_To_Button_Icon_File_Name_Dict.get(int(bind_list[0].substr(1)))
				if icon_file_name:
					primary_rebind_slot_icon = load(button_icon_folder_path+icon_file_name)
				else:
					primary_rebind_slot_icon = load(blank_button_icon_folder_path+blank_mouse_texture_name)
				# Add keybind event using button index derived from numbers of bind code, found with substr() and cast to an int
				var primary_keybind_event = InputEventMouseButton.new()
				primary_keybind_event.set_button_index(int(bind_list[0].substr(1)))
				primary_keybind_event.pressed = true
				InputMap.action_add_event(section_key, primary_keybind_event)
			elif bind_list[0][0] == "k":
				# If the keycode is in the icon dictionary, load that icon. If not, load the blank mouse icon
				# Use string slicing to get the numbers of the bind code, then convert it to an int for the dict
				var icon_file_name = Keycode_To_Button_Icon_File_Name_Dict.get(int(bind_list[0].substr(1)))
				if icon_file_name:
					primary_rebind_slot_icon = load(button_icon_folder_path+icon_file_name)
				else:
					primary_rebind_slot_icon = load(blank_button_icon_folder_path+blank_key_texture_name)
				# Add keybind event using keycode derived from numbers of bind code, found with substr() and cast to an int
				var primary_keybind_event = InputEventKey.new()
				primary_keybind_event.set_keycode(int(bind_list[0].substr(1)))
				primary_keybind_event.pressed = true
				InputMap.action_add_event(section_key, primary_keybind_event)
			Rebind_Action_To_Primary_Icon_Node_Dict.get(str(section_key)).texture = primary_rebind_slot_icon
		else:
			Rebind_Action_To_Primary_Icon_Node_Dict.get(str(section_key)).texture = null
		
		if bind_list[1] != "":
			# Load the button icons for the bind codes in the config file to the secondary rebind slot, adapting 
			# to different input methods depending on the first letter of the bind code
			var secondary_rebind_slot_icon
			if bind_list[1][0] == "m":
				# If the mouse index is in the icon dictionary, load that icon. If not, load the blank mouse icon
				# Use string slicing to get the numbers of the bind code, then convert it to an int for the dict
				var icon_file_name = Mouse_Index_To_Button_Icon_File_Name_Dict.get(int(bind_list[1].substr(1)))
				if icon_file_name:
					secondary_rebind_slot_icon = load(button_icon_folder_path+icon_file_name)
				else:
					secondary_rebind_slot_icon = load(blank_button_icon_folder_path+blank_mouse_texture_name)
				# Add keybind event using button index derived from numbers of bind code, found with substr() and cast to an int
				var secondary_keybind_event = InputEventMouse
				secondary_keybind_event.set_button_index(int(bind_list[1].substr(1)))
				secondary_keybind_event.pressed = true
				InputMap.action_add_event(section_key, secondary_keybind_event)
			elif bind_list[1][0] == "k":
				# If the keycode is in the icon dictionary, load that icon. If not, load the blank key icon
				# Use string slicing to get the numbers of the bind code, then convert it to an int for the dict
				var icon_file_name = Keycode_To_Button_Icon_File_Name_Dict.get(int(bind_list[1].substr(1)))
				if icon_file_name:
					secondary_rebind_slot_icon = load(button_icon_folder_path+icon_file_name)
				else:
					secondary_rebind_slot_icon = load(blank_button_icon_folder_path+blank_key_texture_name)
				# Add keybind event using keycode derived from numbers of bind code, found with substr() and cast to an int
				var secondary_keybind_event = InputEventKey.new()
				secondary_keybind_event.set_keycode(int(bind_list[1].substr(1)))
				secondary_keybind_event.pressed = true
				InputMap.action_add_event(section_key, secondary_keybind_event)
			Rebind_Action_To_Secondary_Icon_Node_Dict.get(str(section_key)).texture = secondary_rebind_slot_icon
		else:
			Rebind_Action_To_Secondary_Icon_Node_Dict.get(str(section_key)).texture = null
	#endregion
	
	#region <> Audio settings
	# Very important to divide each of these by around 100 to get a range close to 0-1
	# because otherwise upon loading an existing config file the player's eardrums will be blasted out by 
	# horribly deep-fried and amplified audio (ask me how I know)
	AudioServer.set_bus_volume_linear(0, config_file.get_value("Audio", "Master_Volume") / 80.0)
	Master_Volume_Slider.value = config_file.get_value("Audio", "Master_Volume")
	AudioServer.set_bus_volume_linear(1, config_file.get_value("Audio", "Music_Volume") / 80.0)
	Music_Volume_Slider.value = config_file.get_value("Audio", "Music_Volume")
	AudioServer.set_bus_volume_linear(2, config_file.get_value("Audio", "SFX_Volume") / 80.0)
	SFX_Volume_Slider.value = config_file.get_value("Audio", "SFX_Volume")
	#endregion
	
	#region <> Video settings
	World_Environment.environment.adjustment_brightness = config_file.get_value("Video", "Brightness")
	Video_Brightness_Slider.value = World_Environment.environment.adjustment_brightness
	World_Environment.environment.adjustment_contrast = config_file.get_value("Video", "Contrast")
	Video_Contrast_Slider.value = World_Environment.environment.adjustment_contrast
	World_Environment.environment.adjustment_saturation = config_file.get_value("Video", "Saturation")
	Video_Saturation_Slider.value = World_Environment.environment.adjustment_saturation
	# Screen shake and blur
	Screen_Shake_Button.button_pressed = config_file.get_value("Video", "Screen_Shake")
	Screen_Blur_Button.button_pressed = config_file.get_value("Video", "Screen_Blur")
	# Window setting
	Window_Mode_Button.selected = Button_To_WindowMode_Index_Dict.find_key(ProjectSettings.get_setting_with_override("display/window/size/mode"))
	DisplayServer.window_set_size(Vector2(float(ProjectSettings.get_setting_with_override("display/window/size/window_width_override")), float(ProjectSettings.get_setting_with_override("display/window/size/window_height_override"))))
	#endregion

# Save settings upon quitting application at window manager request
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		Save_Config(config)
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
			Save_Window_Size(DisplayServer.window_get_size().x, DisplayServer.window_get_size().y)
	elif what == NOTIFICATION_WM_MOUSE_EXIT:
		keyboard_navigation_mode = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		if mouse_filters.size() > 0:
			Set_Hoverable_Control_Mouse_Filters_To_List(mouse_filters)
		InputMap.action_erase_events("ui_up")
		InputMap.action_erase_events("ui_down")
#endregion

#to test combat scene
func _on_emmetts_test_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Areas/combat_test.tscn")
