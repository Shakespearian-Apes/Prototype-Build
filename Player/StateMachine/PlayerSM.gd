extends "res://State_Maschine.gd"
class_name PlayerStateMachine

func _ready():
	get_node("/root/Root").set_player(get_parent())
