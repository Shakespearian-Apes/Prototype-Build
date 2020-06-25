extends "EnemyState.gd"

func enter(_machine):
	animated_sprite.play("idle")

func update_process(machine, _delta):
	if this_enemy.see_player:
		machine._change_state("walk")
