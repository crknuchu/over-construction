extends Area2D

#signal pickup
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	animated_sprite_2d.play()

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body is Player:
			body.add_score()
			queue_free()
