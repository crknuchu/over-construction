extends CharacterBody2D
class_name Movable2

@export var GRAVITY = 10
var picked_up = false
@onready var collision = $CollisionPolygon2D
@onready var sprite_2d = $Sprite2D
@onready var box = $Box
@onready var scaffold = $scaffold
@onready var boxcollision = $boxcollision

func _physics_process(delta):
	if not picked_up:
		velocity.y += delta * GRAVITY
		move_and_slide()
	else:
		box.visible = false
		sprite_2d.visible = true
