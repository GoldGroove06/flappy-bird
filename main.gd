extends Node
@export var pipe_scene: PackedScene

func _ready():
	$PipeTimer.start()

func _on_pipe_timer_timeout():
	var pipe = pipe_scene.instantiate()
	pipe.position = Vector2(480,randf_range(200,400))
	add_child(pipe)
