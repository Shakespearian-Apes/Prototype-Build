extends "EnemyState.gd"

func enter(_machine):
	animated_sprite.play("walk")

func update_process(machine, _delta):
	if not this_enemy.see_player:
		machine._change_state("idle")
	var player_position = player.get_global_position()
	var enemy_position = this_enemy.get_global_position()
	var velocity = (player_position - enemy_position).normalized()
	if enemy_position.distance_to(player_position) <= 50:
		this_enemy.attack()
	else:
		if velocity.x > 0:
			flip.set_scale(Vector2(1,1))
		elif velocity.x < 0:
			flip.set_scale(Vector2(-1,1))
		this_enemy.move_and_slide(velocity * 200)
