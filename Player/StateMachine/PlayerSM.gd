extends "res://State_Maschine.gd"
class_name PlayerStateMachine

func _ready():
	root.set_player(get_parent())


# gets called from the weapon script to apply health reduction
func take_damage(damage:int, enemy:Node ):
	parent.health -= damage
	if parent.health < 1:
		player_dead(enemy)

# handles everything to handle the player take over
func player_dead(enemy : Node):
	root.player_dead(enemy)
	parent.queue_free()
