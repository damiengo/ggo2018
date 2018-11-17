extends KinematicBody2D

# Example: https://www.youtube.com/watch?v=4CLvL05Av6g

var speed = 500
var velocity = Vector2(0,0)
var move_left_right = false
var is_falling = false

func _ready():
	velocity.x = 0
	velocity.y = 1
	set_process_input(true) 

func _physics_process(delta):
	if is_falling:
		var motion = delta * velocity * speed
		var collision = move_and_collide(motion)
		# Adjust x position
		if(!move_left_right and fmod(position.x, 32) < 3):
			velocity.x = 0
			position.x -= fmod(position.x, 32)

func _input(event):
	if is_falling:
		if event.is_action_pressed("ui_left"):
			move_left_right = true
			velocity.x -= 1
		if event.is_action_pressed("ui_right"):
			move_left_right = true
			velocity.x += 1
		if event.is_action_released("ui_left"):
			move_left_right = false
		if event.is_action_released("ui_right"):
			move_left_right = false
		
		if event.is_action_pressed("ui_up"):
			rotate()

func rotate():
	rotation += PI/2