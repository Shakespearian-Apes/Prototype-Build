extends "Player_State.gd"

func enter(_machine):
	animated_sprite.play("idle")


func update_process(machine, delta):
	# gets called as part of _process and checks if the player moves to then change state
	var input_direction = get_input_direction()
	if input_direction:
		machine._change_state('walk')
	## enemys dont have this animation
