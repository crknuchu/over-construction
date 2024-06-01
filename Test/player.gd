extends CharacterBody2D

func _ready():
	pass
	
@export var GRAVITY = 300.0
@export var WALK_SPEED = 200
@export var JUMP = 200

@onready var mouse_point = $Point


func _physics_process(delta):
	mouse_point.global_position = get_global_mouse_position()
	
	velocity.y += delta * GRAVITY

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP

	if Input.is_action_pressed("left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	
	

	move_and_slide()
	

