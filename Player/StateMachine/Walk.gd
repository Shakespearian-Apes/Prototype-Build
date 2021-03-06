extends "Player_State.gd"

func enter(_machine):
	animated_sprite.play("walk")

func update_process(machine, delta):
	var input_direction = get_input_direction()
	if get_input_attack():
		player.attack()
	if not input_direction:
		machine._change_state('idle')
	velocity = input_direction.normalized() * player.MAX_SPEED
	if velocity.x > 0:
		flip.set_scale(Vector2(1,1))
	elif velocity.x < 0:
		flip.set_scale(Vector2(-1,1))
	velocity = player.move_and_slide(velocity)
