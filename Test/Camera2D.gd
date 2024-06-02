extends Camera2D

@export var camera_speed = 50
@export var camera_edge_speed = 200
@onready var player = $"../Player"
@onready var timer = $Timer
var timer_started = false
@export var randomstrength = 30.0
@export var shakefade = 5.0

var rng = RandomNumberGenerator.new()

var shake_strength = 0.0

func _ready():
	timer.start()

func _process(delta):
	#if Input.is_action_just_pressed("left_click"):
		#apply_shake()
	if shake_strength>0:
		shake_strength = lerpf(shake_strength,0,shakefade*delta)
	offset = randomOffset()
	
	if timer_started:
		global_position.y -= camera_speed * delta
		#print(player.global_position)
		#print(global_position)
		var screensize = get_viewport().size
		var width = -1*screensize[1]/2.0
		var idk = global_position.y + width + 100
		#print(idk)
		
		if player.global_position.y < idk:
			#print("AAAA")
			global_position.y -= camera_edge_speed * delta

func apply_shake():
	shake_strength = randomstrength

func randomOffset():
	return Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))

func _on_timer_timeout():
	timer_started = true
