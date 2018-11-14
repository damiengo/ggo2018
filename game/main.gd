extends Node

var _block_size = 32

var _block_types = [
	preload("res://blocks/s.tscn")
]

var _falling_blocks = []

func _ready():
	var block_resource = _block_types[0]
	var block = block_resource.instance()
	block.position = Vector2(_block_size * 5, _block_size * 8)
	add_child(block)
	_falling_blocks.append(block)
	print(block.position)