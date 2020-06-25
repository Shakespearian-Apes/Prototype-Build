extends Node


signal setPlayer
signal playerDead

var player_node : Node



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#gets called from the PlayerStateMachine to let the root know who the player node is
func set_player(node : Node) -> void:
	print(node)
	player_node = node
	player_node.get_node("Camera").current = true
	emit_signal("setPlayer")

func player_dead(node) -> void:
	emit_signal("playerDead", node)
