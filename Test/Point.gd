extends Area2D

@onready var player = get_parent()
var carrying = false
var picked_up_item = null
var duplicate = null
@onready var constr_02 = $SFX/constr02

func _physics_process(_delta):
	if duplicate != null:
		duplicate.global_position = get_global_mouse_position()
	
	if Input.is_action_just_pressed("left_click"):
		
		if carrying:
			picked_up_item.global_position = get_global_mouse_position()
			picked_up_item.collision.disabled = false
			picked_up_item.reparent(player.get_parent())
			carrying = false
			duplicate.queue_free()
			picked_up_item.scaffold.show()
			picked_up_item.scaffold.play()
			get_viewport().get_camera_2d().apply_shake()
			constr_02.play()
	
		for body in get_overlapping_bodies():
			if body is Movable or body is Movable2:
				if not body.picked_up:
					carrying = true
					picked_up_item = body
					picked_up_item.picked_up = true
					picked_up_item.boxcollision.disabled = true
					picked_up_item.global_position = player.global_position
					#picked_up_item.global_position.x = lerp(picked_up_item.global_position.x,player.global_position.x, 1)
					picked_up_item.reparent(player)
					duplicate = picked_up_item.duplicate()
					player.get_parent().add_child(duplicate)
					duplicate.sprite_2d.self_modulate.a = 0.5
					duplicate.box.visible = false
					duplicate.sprite_2d.visible = true
