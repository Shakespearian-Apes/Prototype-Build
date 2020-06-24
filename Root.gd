extends Node


signal setPlayer
signal playerDead

var player_node : Node



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_player(node : Node) -> void:
	"""gets called from the PlayerStateMachine to let the root know who the player node is
	"""
	print(node)
	player_node = node
	emit_signal("setPlayer")

func player_dead(node) -> void:
	emit_signal("playerDead", node)