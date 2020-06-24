extends "Player_State.gd"

func enter(_machine):
	animated_sprite.play("idle")


# gets called as part of _process and checks if the player moves to then change state
func update_process(machine, delta):
	var input_direction = get_input_direction()
	if get_input_attack():
		player.attack()
	if input_direction:
		machine._change_state('walk')
	## enemys dont have this animation
