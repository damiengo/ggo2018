extends Node

var _block_size = 32

var _block_types = [
	preload("res://blocks/t.tscn")
]

var _falling_blocks = []

func _ready():
	var block_resource = _block_types[0]
	var block = block_resource.instance()
	block.position = Vector2(_block_size * 5, _block_size * 3)
	add_child(block)
	_falling_blocks.append(block)

func _process(delta):
	var speed = 20
	for falling_block in _falling_blocks:
		falling_block.move_local_y(_block_size*delta*speed)