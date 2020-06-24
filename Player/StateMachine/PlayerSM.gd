extends "res://State_Maschine.gd"
class_name PlayerStateMachine

func _ready():
	root.set_player(get_parent())
	parent.connect("got_hit", self, "take_damage")


func take_damage(damage:int, enemy:Node ):
	# gets called from the weapon script to apply health reduction
	parent.health -= damage
	if parent.health < 1:
		player_dead(enemy)

func player_dead(enemy : Node):
	# handles everything to handle the player take over
	root.player_dead(enemy)
	parent.queue_free()
