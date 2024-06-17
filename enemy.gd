class_name Enemy
extends CharacterBody2D

@export var MAX_HEALTH: int
@onready var slime = %Slime

@onready var player = get_node("/root/Game/Player")

var health = 0

const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")

func _ready():
	health = MAX_HEALTH
	slime.play_walk()
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction.normalized() * 500
	move_and_slide()

func take_damage():
	health -= 1
	
	slime.play_hurt()
	
	if health == 0:
		queue_free()
		
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
