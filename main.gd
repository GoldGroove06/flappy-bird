extends Node
@export var pipe_scene: PackedScene

func _ready():
	$Bird.hide()
	
func _on_pipe_timer_timeout():
	var pipe = pipe_scene.instantiate()
	pipe.position = Vector2(480,randf_range(200,400))
	add_child(pipe)

func game_start():
	var score = 0
	$Bird.show()
	get_tree().call_group("pipes", "queue_free")
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$PipeTimer.start()
	

func _on_bird_hit():
	$PipeTimer.stop()
	$HUD.show_game_over()

func _on_hud_start_game():
	game_start()
