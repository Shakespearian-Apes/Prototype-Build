extends "Player_State.gd"

func update_process(machine, delta):
	var input_direction = get_input_direction()
	if not input_direction:
		machine._change_state('idle')
	velocity = input_direction.normalized() * player.get_parent().MAX_SPEED
	velocity = player.move_and_slide(velocity)

	if velocity.x > 0:
		player.get_node("Sprite").flip_h = false
		player.get_node("AnimationPlayer").play("Walking")
	elif velocity.x < 0:
		player.get_node("Sprite").flip_h = true
		player.get_node("AnimationPlayer").play("Walking")
	elif velocity.y != 0:
		player.get_node("AnimationPlayer").play("Walking")
