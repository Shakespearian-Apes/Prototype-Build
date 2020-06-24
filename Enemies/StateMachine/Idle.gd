extends "EnemyState.gd"

func enter(_machine):
	animated_sprite.play("idle")

func update_process(machine, delta):
	if parent.noplayer:
		machine._change_state("playerdead")
	if this_enemy.see_player:
		machine._change_state("walk")
