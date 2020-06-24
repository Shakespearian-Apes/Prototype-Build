extends "res://State.gd"
class_name EnemyState
# State for enemy States extends from
# offers some functions per inheritance


var player
onready var this_enemy = parent.get_parent()

onready var root : Node = get_node("/root/Root")

# Called when the node enters the scene tree for the first time.
func _ready():
	root.connect("setPlayer", self, "set_player_node")
	set_player_node()

# gets called after root got the new player so enemies can update there player tracking
func set_player_node() -> void:
	player = root.player_node