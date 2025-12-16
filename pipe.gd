extends StaticBody2D

@export var speed := 150
@export var direction := Vector2.RIGHT

var moving := true

func _ready():
	$Timer.wait_time = 1.0
	$Timer.start()

func _process(delta):
	if moving:
		position -= direction.normalized() * speed * delta

func _on_Timer_timeout():
	moving = !moving
