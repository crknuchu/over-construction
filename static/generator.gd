extends Node2D

@onready var timer = $Timer
@onready var camera_2d = $"../Camera2D"
@onready var metal_1x4 = load("res://static/metal_1x_4.tscn")
@onready var blocks = [metal_1x4]

func spawn_block():
	var index = randf_range(0,blocks.size())
	var instance = blocks[index].instantiate()
	var x = randf_range(-get_viewport().size[0]/2, get_viewport().size[0]/2)
	var y = camera_2d.global_position.y - 500
	instance.global_position = Vector2(x,y)

	get_parent().add_child(instance)
	
func _ready():
	timer.start()
	
func _on_timer_timeout():
	#print("AAAAA")
	spawn_block()
	
