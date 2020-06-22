extends "res://State_Maschine.gd"
class_name PlayerStateMachine

func _ready():
	var root = get_node("/root/Root")
	root.set_player(get_parent())
