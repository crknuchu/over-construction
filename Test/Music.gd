extends Node2D
@onready var speed_timer = $SpeedTimer
@onready var music_first = $MusicFirst
@onready var music_second = $MusicSecond
@onready var music_third = $MusicThird

func _ready():
	music_first.play()
	speed_timer.start()

func _on_speed_timer_timeout():
	if music_first.playing:
		music_first.stop()
		music_second.play()
	elif music_second.playing:
		music_second.stop()
		music_third.play()
