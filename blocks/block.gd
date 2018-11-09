extends KinematicBody2D

# Example: https://www.youtube.com/watch?v=4CLvL05Av6g

var speed = 500
var velocity = Vector2(0,0)

func _ready():
	velocity.x = 0
	velocity.y = 1

func _physics_process(delta):
	if Input.is_action_pressed("move_left"): print("left")
	if Input.is_action_pressed("move_right"): position.x = position.x+32
	var motion = delta * velocity * speed	
	var collision = move_and_collide(motion)