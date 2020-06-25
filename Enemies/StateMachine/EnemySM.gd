extends "res://State_Maschine.gd"
class_name EnemyStateMachine
# handles enemy Specific States and functions
var noplayer : bool = false


func _ready():
	# adds enemy unique states
	states_map['player_dead'] = $PlayerDead
	root.connect("setPlayer", self, "new_player")
	root.connect("playerDead", self, "dead_player")

# when the signal is emited that the player is dead
# this function checks if the parent was the killer and adds the players statemachine
# as a way to take over at the moment
func dead_player(node):
	noplayer = true
	if get_parent() == node:
		var player_state = load("res://Player/StateMachine/PlayerSM.tscn")
		var state_inst = player_state.instance()
		get_parent().add_child(state_inst)
		queue_free()

# sets a flag to let enemies out of the player dead state
func new_player():
	noplayer = false

# handles Enemies taking Damage
func take_damage(dmg: int, inc :Node)->void:
	if inc == parent:
		return
	if inc != root.player_node:
		return
	print(parent.health)
	parent.health -= dmg
	if parent.health < 1:
		parent.queue_free()
