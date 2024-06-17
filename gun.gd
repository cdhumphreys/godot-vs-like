extends Area2D
@onready var gun = $"."

@onready var weapon_pivot = $WeaponPivot
@onready var shooting_point = %ShootingPoint

const BULLET = preload("res://bullet.tscn")

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() == 0:
		return
	
	var target_enemy = enemies_in_range[0]
	weapon_pivot.look_at(target_enemy.global_position)


func shoot():
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = shooting_point.global_position
	new_bullet.global_rotation = shooting_point.global_rotation
	shooting_point.add_child(new_bullet)

func _on_fire_rate_timeout():
	shoot()
