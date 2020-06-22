extends Node


signal setPlayer
signal playerDead

var player_node



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_player(new):
	player_node = new
	emit_signal("setPlayer", player_node)

func player_dead(node):
	emit_signal("playerDead", node)