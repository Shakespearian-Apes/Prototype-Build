extends "res://State_Maschine.gd"
class_name EnemyStateMachine
# handles enemy Specific States and functions
var noplayer = false



func dead_player(node):
	noplayer = true
	if get_parent() == node:
		var player_state = load("res://Player/StateMachine/PlayerSM.tscn")
		var state_inst = player_state.instance()
		get_parent().add_child(state_inst)
		queue_free()

func new_player():
	noplayer = false
