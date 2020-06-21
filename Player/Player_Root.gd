extends Node

#Constants
const MAX_SPEED = 20000
const ACCELERATION = 100
const FRICTION = 100

#Player Movement
var velocity = Vector2.ZERO
var input_vector = Vector2.ZERO

func _ready():
	pass

func _process(delta):
	if get_node_or_null("../Script_Node").can_move == true:
		get_input(delta)

func get_input(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	velocity = input_vector * MAX_SPEED * delta
	get_child(0).move_and_slide(velocity)

