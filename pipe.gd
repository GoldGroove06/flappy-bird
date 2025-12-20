extends StaticBody2D

@export var speed := 150
@export var direction := Vector2.RIGHT

var moving := true

func set_speed(s):
	speed= s

func _ready():
	var screen_size = get_viewport().get_visible_rect().size
	$Timer.wait_time = 1.0
	$Timer.start()

func _process(delta):
	if moving:
		position -= direction.normalized() * speed * delta

func _on_Timer_timeout():
	moving = !moving
