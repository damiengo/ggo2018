extends KinematicBody2D

# Example: https://www.youtube.com/watch?v=4CLvL05Av6g

var speed = 800
var velocity = Vector2(0,0)

func _ready():
	velocity.x = 1
	velocity.y = 1

func _physics_process(delta):
	var motion = delta * velocity * speed	
	var collision = move_and_collide(motion)
	if collision:
		if(collision.collider is KinematicBody2D):
			collision.collider.fall()
		velocity = velocity.bounce(collision.normal)