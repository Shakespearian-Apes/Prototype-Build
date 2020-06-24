extends "EnemyState.gd"

func update_process(machine, delta):
	if not parent.noplayer:
		machine._change_state("idle")