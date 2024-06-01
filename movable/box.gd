extends StaticBody2D

@export var speed = 100
@onready var metal_1x4 = load("res://static/metal_1x_4.tscn")
@onready var items = [metal_1x4]



func _physics_process(delta):
	global_position.y += speed * delta
