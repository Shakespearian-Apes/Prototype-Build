extends "EnemyState.gd"


func update_process(machine, delta):
	if enemy.see_player:
		machine._change_state("walk")
