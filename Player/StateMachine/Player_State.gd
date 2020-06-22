extends Node
class_name PlayerState

var player
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent()

func enter(_machine):
	pass

func exit(_machine):
	pass

func get_input_direction():
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_direction.y -= int(Input.get_action_strength("ui_up")) - int(Input.get_action_strength("ui_down"))
	return input_direction

# func move_player():
# 	velocity = player.move_and_slide(velocity)
