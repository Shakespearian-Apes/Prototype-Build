extends "res://State_Maschine.gd"
class_name PlayerStateMachine

func _ready():
	
	root.set_player(get_parent())


# gets called from the weapon script to apply health reduction
func take_damage(damage:int, inc:Node )->void:
	if inc == parent:
		return
	parent.health -= damage
	root.get_node("Hud").lost_health()
	if parent.health < 1:
		player_dead(inc)

# handles everything to handle the player take over
func player_dead(enemy : Node)->void:
	root.player_dead(enemy)
	print("test")
	parent.queue_free()
