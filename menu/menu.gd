extends Node2D


func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_texture_button_pressed():
	#print("AAAA")
	get_tree().change_scene_to_file("res://Test/test.tscn")
