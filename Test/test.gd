extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().change_scene_to_file("res://menu/menu.tscn")
	
