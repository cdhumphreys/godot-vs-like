extends CharacterBody2D
class_name Player
@onready var happy_boo = $HappyBoo


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = direction.normalized() * 1000
	
	if direction.x < 0:
		happy_boo.scale.x = -1
	elif direction.x > 0:
		happy_boo.scale.x = 1
	
	if velocity.length() > 0.0:
		happy_boo.play_walk_animation()
	else:
		happy_boo.play_idle_animation()
		
	move_and_slide()
