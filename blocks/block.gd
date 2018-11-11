extends KinematicBody2D

# Example: https://www.youtube.com/watch?v=4CLvL05Av6g

var speed = 500
var velocity = Vector2(0,0)

func _ready():
	velocity.x = 0
	velocity.y = 1
	set_process_input(true) 

func _physics_process(delta):
	var motion = delta * velocity * speed	
	var collision = move_and_collide(motion)

func _input(event):
	var move_left = event.is_action_pressed("ui_left")
	var move_right = event.is_action_pressed("ui_right")
	
	if move_left:
		print("Move left")
	
	if move_right:
		print("Move right")