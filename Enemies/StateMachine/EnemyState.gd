extends "res://State.gd"


var player
var enemy


# Called when the node enters the scene tree for the first time.
func _ready():
	enemy = get_parent().get_parent()
	get_node("/root/Root").connect("setPlayer", self, "set_new_player_node")
	set_player_node()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_new_player_node(new):
	player = new

func set_player_node():
	player = get_node("/root/Root").player_node