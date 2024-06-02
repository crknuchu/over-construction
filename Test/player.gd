extends CharacterBody2D

func _ready():
	pass
	
@export var GRAVITY = 300.0
@export var WALK_SPEED = 200
@export var JUMP = 200

@onready var mouse_point = $Point
@onready var idle = $idle
@onready var run = $run
@onready var animation_player = $AnimationPlayer
@onready var idlesprite = $idlesprite
@onready var runrightsprite = $runrightsprite
@onready var jumpsprite = $jumpsprite
@onready var runleftsprite = $runleftsprite


func _physics_process(delta):
	mouse_point.global_position = get_global_mouse_position()
	
	velocity.y += delta * GRAVITY

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP
		
	if Input.is_action_pressed("left"):
		velocity.x = -WALK_SPEED
		runleftsprite.show()
		runrightsprite.hide()
		animation_player.play("run_left")
		idlesprite.hide()
		jumpsprite.hide()
		
	elif Input.is_action_pressed("right"):
		velocity.x =  WALK_SPEED
		if is_on_floor():
			runrightsprite.show()
			runleftsprite.hide()
			animation_player.play("run_right")
			idlesprite.hide()
			jumpsprite.hide()
	else:
		velocity.x = 0
		if is_on_floor():
			runrightsprite.hide()
			runleftsprite.hide()
			jumpsprite.hide()
			idlesprite.show()
			animation_player.play("idle")
		
	
	

	move_and_slide()
	

