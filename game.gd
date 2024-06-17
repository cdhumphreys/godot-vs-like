extends Node2D
@onready var spawn_path = %PathFollow2D
@onready var game_over = %GameOver

const ENEMY = preload("res://enemy.tscn")
func spawn_mob():
	spawn_path.progress_ratio = randf()
	var slime = ENEMY.instantiate()
	slime.global_position = spawn_path.global_position
	add_child(slime)

func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	game_over.visible = true
	get_tree().paused = true
