extends KinematicBody2D

# Example: https://www.youtube.com/watch?v=4CLvL05Av6g

var speed = 50
var movedir = Vector2(0,0)

func _physics_process(delta):
	movedir.x = 1
	movedir.y = 1
	var motion = movedir.normalized() * speed
	move_and_slide(motion, Vector2(0,0))	