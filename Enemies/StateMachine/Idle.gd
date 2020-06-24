extends "EnemyState.gd"


func update_process(machine, delta):
	print(parent.noplayer)
	if parent.noplayer:
		machine._change_state("playerdead")
	if this_enemy.see_player:
		machine._change_state("walk")
