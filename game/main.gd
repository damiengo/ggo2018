extends Node

var _screen_height = 25
var _screen_width = 20
var _block_size = 32
var _x_offset = 1
var _y_offset = 1

var _block_types = {}

var _falling_blocks = []

func _ready():
	_block_types.j   = preload("res://blocks/j.tscn")
	_block_types.l   = preload("res://blocks/l.tscn")
	_block_types.i   = preload("res://blocks/i.tscn")
	_block_types.o   = preload("res://blocks/o.tscn")
	_block_types.s   = preload("res://blocks/s.tscn")
	_block_types.t   = preload("res://blocks/t.tscn")
	_block_types.z   = preload("res://blocks/z.tscn")
	_block_types._   = preload("res://blocks/_.tscn")
	_block_types.sel = preload("res://blocks/sel.tscn")
	
	_draw_level(1)
	#_test()
	#_add_blocks()

#
# Set new lines of blocks on top
#
func _add_blocks():
	_add_block("o", 2,  2, 0)
	_add_block("o", 4,  2, 0)
	_add_block("i", 7,  2, 0)
	_add_block("i", 7,  3, 0)
	_add_block("l", 10, 2, 2)
	_add_block("j", 2,  5, 2)
	_add_block("z", 3,  4, 1)
	_add_block("t", 5,  4, 3)
	_add_block("t", 7,  4, 0)

#
# Draw a level
#  index  Index of the level to draw
#
func _draw_level(index):
	# Draw borders
	for i in range(_screen_width):
		_add_block("_", i, 0, 0)
		_add_block("_", i, _screen_height-1, 0)
	for i in range(1,_screen_height-1):
		_add_block("_", 0, i, 0)
		_add_block("_", _screen_width-1, i, 0)
	
	# Draw blocks
	if index == 1:
		# Top walls
		_add_block("_", 7, 1, 0)
		_add_block("_", 7, 2, 0)
		_add_block("_", 7, 3, 0)
		# Blocks
		_add_block("i", 3, 1, 0)
		_add_block("t", 5, 3, 1)
		# Targets
		_add_block("sel", 10, 18, 0)

#
# Add a block on the screen
#  block_type   Type of the block (o, l, z, etc)
#  x            x position
#  y            y position
#  nb_rotations Number of rotations to apply
#
func _add_block(block_type, x, y, nb_rotations):
	var block_resource = _block_types[block_type]
	var block = block_resource.instance()
	block.position = Vector2(_block_size * x, _block_size * y)
	for i in range(nb_rotations):
		block.rotate()
	add_child(block)

func _test():
	var block_resource = _block_types.z
	var block = block_resource.instance()
	block.position = Vector2(_block_size * 5, _block_size * 8)
	add_child(block)
	_falling_blocks.append(block)
	block.fall()