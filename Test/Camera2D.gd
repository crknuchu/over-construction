extends Camera2D

@export var camera_speed = 50
@export var camera_edge_speed = 200
@onready var player = $"../Player"
@onready var timer = $Timer
var timer_started = false

func _ready():
	timer.start()

func _process(delta):
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


func _on_timer_timeout():
	timer_started = true
