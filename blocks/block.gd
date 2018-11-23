extends KinematicBody2D

# Example: https://www.youtube.com/watch?v=4CLvL05Av6g

const sounds = preload("res://sounds/audio.tscn")

var speed = 3*00
var velocity = Vector2(0,0)
var move_left_right = false
var _on_floor = false

func _ready():
	velocity.x = 0
	velocity.y = 0
	set_process_input(true) 

func _physics_process(delta):
	var motion = delta * velocity * speed
	var collision = move_and_collide(motion)
	if !_on_floor and collision and collision.normal.y < 0 and (collision.collider.is_in_group("wall") or collision.collider.is_on_floor()):
		velocity.y = 0
		_stop_move_left_right()
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://sounds/fruit_collect_1.wav")
		player.play()
		_on_floor = true

func _input(event):
	if velocity.y != 0 and !_on_floor:
		if event.is_action_pressed("ui_left"):
			move_left_right = true
			velocity.x -= 1
		if event.is_action_pressed("ui_right"):
			move_left_right = true
			velocity.x += 1
		if event.is_action_released("ui_left") \
		or event.is_action_released("ui_right"):
			_stop_move_left_right()
		
		if event.is_action_pressed("ui_up"):
			var player = AudioStreamPlayer.new()
			self.add_child(player)
			player.stream = load("res://sounds/bubble1.wav")
			player.play()
			rotate()

func fall():
	if !is_in_group("wall") and !_on_floor:
		velocity.y = 1

func rotate():
	rotation += PI/2

func is_on_floor():
	return _on_floor

func _stop_move_left_right():
	velocity.x = 0
	position = position.snapped(Vector2(32,32))
	move_left_right = false