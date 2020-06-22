extends "EnemyState.gd"

func update_process(machine, delta):
	if not enemy.see_player:
		machine._change_state("idle")
	var player_position = player.get_global_position()
	var enemy_position = enemy.get_global_position()
	var velocity = (player_position - enemy_position).normalized()
	if enemy_position.distance_to(player_position) <= 50:
		enemy.attack()
	else:
		enemy.move_and_slide(velocity * 200)
