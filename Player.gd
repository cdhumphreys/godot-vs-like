extends CharacterBody2D
class_name Player

signal health_depleted

@onready var happy_boo = $HappyBoo
@onready var hurt_box = %HurtBox
@onready var progress_bar = %ProgressBar

@export var MAX_HEALTH: float
@export var DAMAGE_RATE: float

var health = 0.0

func _ready():
	health = MAX_HEALTH
	progress_bar.max_value = MAX_HEALTH
	progress_bar.value = health


func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = direction.normalized() * 1000
	
	if direction.x < 0:
		happy_boo.scale.x = -1
	elif direction.x > 0:
		happy_boo.scale.x = 1
	move_and_slide()
	
	if velocity.length() > 0.0:
		happy_boo.play_walk_animation()
	else:
		happy_boo.play_idle_animation()
	

	var overlapping_mobs = hurt_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		progress_bar.value = health
		if health <= 0.0:
			health_depleted.emit()
