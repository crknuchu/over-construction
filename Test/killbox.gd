extends Area2D

@onready var collision_shape_2d = $CollisionShape2D
@onready var timer = $Timer


func _process(delta):
	for body in get_overlapping_bodies():
		if body is Player:
			body.GRAVITY = 0
			body.velocity.y = 0
			body.idlesprite.hide()
			body.runleftsprite.hide()
			body.runrightsprite.hide()
			body.jumpsprite.hide()
			body.death.show()
			body.animation_player.play("death")
			timer.start()
			#get_tree().quit()


func _on_timer_timeout():
	print("GAME OVER")
	get_tree().quit()
