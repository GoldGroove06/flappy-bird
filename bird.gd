extends RigidBody2D
var screen_size
signal hit

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		print("pressed jump")
		apply_impulse(Vector2(0, -200))
		$AnimatedSprite2D.play()



func _on_body_entered(body: Node):
	hit.emit()
	print("hit")
