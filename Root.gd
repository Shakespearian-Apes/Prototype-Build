extends Node


signal setPlayer
signal playerDead

var player_node : KinematicBody2D

onready var entitys : Node = $Test_Level.get_node("Entitys")



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


func _process(_delta):
	if entitys.get_child_count() == 1:
		var witch_scene : PackedScene = load("res://Enemies/Witch/Witch.tscn")
		var witch : Sprite  = witch_scene.instance()
		witch.position = $Test_Level.get_node("WitchSpawn").global_position
		player_node.position = $Test_Level.get_node("PlayerSpawn").global_position
		entitys.add_child(witch)
