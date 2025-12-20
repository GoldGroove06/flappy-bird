extends RigidBody2D
var screen_size
signal hit
var collision
var frozen
var freeze_position: Vector2

func freeze():
	frozen = true
	freeze_position = global_position

func _ready():
	collision = false
	frozen = false
	screen_size = get_viewport_rect().size

func _process(delta):
	if collision != true :
		if Input.is_action_just_pressed("jump"):
			print("pressed jump")
			apply_impulse(Vector2(0, -200))
			$AnimatedSprite2D.play()

#func _integrate_forces(state):
	#if frozen:
		#state.linear_velocity = Vector2.ZERO
		#state.angular_velocity = 0
		#state.transform.origin = freeze_position


func _on_body_entered(body: Node):
	hit.emit()
	collision =true 
	freeze()
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D.flip_v = true
	$AnimatedSprite2D.pause()
	print("hit")
