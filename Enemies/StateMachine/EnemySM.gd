extends "res://State_Maschine.gd"
class_name EnemyStateMachine
# handles enemy Specific States and functions
var noplayer : bool = false


func _ready():
	# adds enemy unique states
	states_map['player_dead'] = $PlayerDead
	root.connect("setPlayer", self, "new_player")
	root.connect("playerDead", self, "dead_player")

func dead_player(node):
	noplayer = true
	if get_parent() == node:
		var player_state = load("res://Player/StateMachine/PlayerSM.tscn")
		var state_inst = player_state.instance()
		get_parent().add_child(state_inst)
		queue_free()

func new_player():
	noplayer = false

# handles Enemies taking Damage
func take_damage(dmg: int, inc :Node)->void:
	if inc == parent:
		return
	parent.health -= dmg
	if parent.health < 1:
		queue_free()
