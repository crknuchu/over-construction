extends Area2D

@onready var collision_shape_2d = $CollisionShape2D
@onready var timer = $Timer
@onready var death = $Death

@onready var dead =  false

func _process(delta):
	for body in get_overlapping_bodies():
		if body is Player and not dead:
			#print("AAAAA")
			body.GRAVITY = 0
			body.velocity.y = 0
			body.idlesprite.hide()
			body.runleftsprite.hide()
			body.runrightsprite.hide()
			body.jumpsprite.hide()
			body.death.show()
			body.animation_player.play("death")
			#print("BBBBB")
			dead = true
			death.play()
			await get_tree().create_timer(5).timeout
			get_tree().quit()


func _on_timer_timeout():
	print("GAME OVER")
	#death.play()
	get_tree().quit()
