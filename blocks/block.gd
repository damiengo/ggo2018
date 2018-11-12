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
	if event.is_action_pressed("ui_left"):
		velocity.x -= 1
	if event.is_action_released("ui_left"):
		velocity.x = 0
	if event.is_action_pressed("ui_right"):
		velocity.x += 1
	if event.is_action_released("ui_right"):
		velocity.x = 0