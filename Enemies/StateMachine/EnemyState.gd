extends "res://State.gd"
# State for enemy States extends from
# offers some functions per inheritance


var player
var enemy
onready var root = get_node("/root/Root")


# Called when the node enters the scene tree for the first time.
func _ready():
	enemy = get_parent().get_parent()
	root.connect("setPlayer", self, "set_player_node")
	set_player_node()


func set_player_node() -> void:
	# gets called after root got the new player so enemies can update there player tracking
	player = root.player_node