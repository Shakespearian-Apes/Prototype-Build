extends "Player_State.gd"

func enter(machine):
	pass

func update_process(machine, delta):
	var input_direction = get_input_direction()
	if input_direction:
		machine._change_state('walk')
	## enemys dont have this animation
	# player.get_node("AnimationPlayer").play("idle")
