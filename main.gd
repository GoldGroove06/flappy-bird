extends Node
@export var pipe_scene: PackedScene
@export var bird_scene: PackedScene
var bird_instance: Node = null

func _ready():
	var screen_size = get_viewport().get_visible_rect().size
	print("ready")
	
func _on_pipe_timer_timeout():
	var pipe = pipe_scene.instantiate()
	pipe.position = Vector2(480,randf_range(200,400))
	add_child(pipe)

func game_start():
	get_tree().call_group("birds", "queue_free")
	var score = 0
	get_tree().call_group("pipes", "queue_free")
	get_tree().call_group("pipes", "set_speed", 150)
	var bird_instance = bird_scene.instantiate()
	bird_instance.position = Vector2(160,257)
	add_child(bird_instance)
	bird_instance.hit.connect(_on_bird_hit)
	
	#$HUD.update_score(score)
	$PipeTimer.start()
	

func _on_bird_hit():
	get_tree().call_group("pipes", "set_speed", 0)
	$PipeTimer.stop()
	$HUD.show_game_over()

func _on_hud_start_game():
	print("start game")
	game_start()
