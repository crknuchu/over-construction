extends Area2D

#signal pickup
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var screw = $SCREW
@onready var pickup = false

func _ready():
	animated_sprite_2d.play()

func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body is Player and not pickup:
			body.add_score()
			screw.play()
			pickup = true
			animated_sprite_2d.hide()
			await get_tree().create_timer(1).timeout
			queue_free()
