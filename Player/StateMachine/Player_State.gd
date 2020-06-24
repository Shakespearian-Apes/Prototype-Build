extends "res://State.gd"
class_name PlayerState

var player
var velocity = Vector2()

func _ready():
	player = get_parent().get_parent()

func get_input_direction():
	# builds a move vector from player inputs and returns it
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_direction.y -= int(Input.get_action_strength("ui_up")) - int(Input.get_action_strength("ui_down"))
	return input_direction

func get_input_attack():
	return Input.is_action_pressed("ui_select")
# func move_player():
# 	velocity = player.move_and_slide(velocity)
