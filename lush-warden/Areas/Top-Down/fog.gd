extends Sprite2D

@onready var Player = %Top_Down_Player

var blank_texture = preload("uid://c2nans5fkpi7b")
var clear_texture = preload("res://Areas/Top-Down/LushWarden Fog Clearing Mask (5).png")
var initial_clear_texture = preload("res://Areas/Top-Down/LushWarden_Inverse_Fog_Clearing_Mask.png")

var blit_material = BlitMaterial.new()
var fog_texture : DrawableTexture2D
var texture_size = Vector2i(1920, 1080)
var clearing_rect_size = Vector2i(180,180)
var player_position
var clear_delay = 0.05
var clear_timer := Timer.new()
var fog_clear_cooldown = false
var initial_clears = 0
var initial_clear_amount = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fog_texture = DrawableTexture2D.new()
	fog_texture.setup(texture_size.x, texture_size.y, DrawableTexture2D.DRAWABLE_FORMAT_RGBA8, Color(0.9, 0.9, 0.9, 0.97), false)
	blit_material.blend_mode = BlitMaterial.BLEND_MODE_MUL
	blit_material.blend_mode = BlitMaterial.BLEND_MODE_MUL
	
	#clear_texture = blank_texture
	
	self.texture = fog_texture
	
	player_position = Vector2i((Player.position.x / 4) - (clearing_rect_size.x / 2), 
	(Player.position.y / 4) - (clearing_rect_size.y / 2))
	
	#clear_timer = get_tree().create_timer(clear_delay, false, true, false)
	#clear_timer.timeout().connect(_on_clear_timer_timeout())
	add_child(clear_timer)
	clear_timer.wait_time = clear_delay
	clear_timer.one_shot = true
	clear_timer.timeout.connect(_on_clear_timer_timeout)
	fog_clear_cooldown = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_position = Vector2i((Player.position.x / 4) - (clearing_rect_size.x / 2), 
	(Player.position.y / 4) - (clearing_rect_size.y / 2))
	
	if ((fog_clear_cooldown == false) and ((abs(Player.velocity.length()) >= Player.SPEED / 2) or initial_clears < initial_clear_amount)):
		initial_clears += 1
		clear_timer.start()
		fog_clear_cooldown = true
		print("process")
	
	self.texture = fog_texture

func _on_clear_timer_timeout():
	fog_clear_cooldown = false
	#var blank_texture = Image.create_empty(clearing_rect_size.x, clearing_rect_size.y, false, Image.FORMAT_RGBA8)
	#blit_material.blend_mode = BlitMaterial.BLEND_MODE_MIX
	#fog_texture.blit_rect(Rect2i(player_position, clearing_rect_size), blank_texture, Color(0.9, 0.9, 0.9, 0.97), 0, blit_material)
	#blit_material.blend_mode = BlitMaterial.BLEND_MODE_SUB
	fog_texture.blit_rect(Rect2i(player_position, clearing_rect_size), clear_texture, Color(1, 1, 1, 1), 0, blit_material)
	clear_timer.wait_time = clear_delay
	print("clearing")
