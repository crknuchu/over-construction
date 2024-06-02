extends CharacterBody2D
class_name Player

func _ready():
	pass
	
@export var GRAVITY = 300.0
@export var WALK_SPEED = 200
@export var JUMP = 200
@onready var score = $"Score System/score"

@onready var mouse_point = $Point
@onready var animation_player = $AnimationPlayer
@onready var idlesprite = $idlesprite
@onready var runrightsprite = $runrightsprite
@onready var jumpsprite = $jumpsprite
@onready var runleftsprite = $runleftsprite
@onready var death = $death
@onready var score_val = 0
@onready var add_to_score = false
@onready var t = 5
@onready var coyote_timer = $CoyoteTimer

var coyote_time = 0.1
var can_jump = false

func add_score():
	score_val += 500

func keep_score():
	#if add_to_score:
		#score_val = 
	score_val += 0.1
	score.text = str(int(score_val))

func _physics_process(delta):
	t-=delta
	if t<=0:
		keep_score()
	
	mouse_point.global_position = get_global_mouse_position()
	
	velocity.y += delta * GRAVITY

	if is_on_floor() and can_jump == false:
		can_jump = true
	elif can_jump == true and coyote_timer.is_stopped():
			coyote_timer.start(coyote_time)

	if Input.is_action_just_pressed("jump") and can_jump:
		velocity.y = -JUMP
		
	if Input.is_action_pressed("left"):
		velocity.x = -WALK_SPEED
		runleftsprite.show()
		runrightsprite.hide()
		animation_player.play("run_left")
		idlesprite.hide()
		jumpsprite.hide()
		death.hide()
		
	elif Input.is_action_pressed("right"):
		velocity.x =  WALK_SPEED
		if is_on_floor():
			runrightsprite.show()
			runleftsprite.hide()
			animation_player.play("run_right")
			idlesprite.hide()
			jumpsprite.hide()
			death.hide()
	else:
		velocity.x = 0
		if is_on_floor():
			runrightsprite.hide()
			runleftsprite.hide()
			jumpsprite.hide()
			death.hide()
			idlesprite.show()
			animation_player.play("idle")
		
	move_and_slide()
	



func _on_coyote_timer_timeout():
	can_jump = false
