extends KinematicBody2D

# Example: https://www.youtube.com/watch?v=4CLvL05Av6g

var speed = 400
var velocity = Vector2(0,0)

var _block_types = [
	preload("res://blocks/t.tscn")
]

func _ready():
	velocity.x = 1
	velocity.y = 1
	
	var block_resource = _block_types[0]
	var block = block_resource.instance()
	block.position = Vector2(100,100)
	add_child(block)

func _physics_process(delta):
	print(velocity)
	var motion = delta * velocity * speed
	
	var collision = move_and_collide(motion)
	if collision:
		velocity = velocity.bounce(collision.normal)