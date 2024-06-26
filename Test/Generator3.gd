extends Node2D

@onready var node_2d = $Node2D
@onready var timer = $Timer
@onready var list = [node_2d]

func _ready():
	timer.start()

func _on_timer_timeout():
	var instance = 	node_2d.duplicate()
	get_parent().add_child(instance)
	instance.get_child(0).play()
	instance.get_child(1).play()
	instance.get_child(2).play()
	instance.global_position.y = get_viewport().get_camera_2d().global_position.y
