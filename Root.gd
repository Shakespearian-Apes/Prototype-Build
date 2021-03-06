extends Node


signal setPlayer
signal playerDead

export var revive : int = 4

var player_node : KinematicBody2D
var win : bool = false
var gameover : bool = false
var boss : bool = false
var can_move : bool = false

onready var entitys : Node = $Test_Level.get_node("Entitys")



# Called when the node enters the scene tree for the first time.
func _ready():
	$Hud.connect("game_start", self, "_game_start")
	pass # Replace with function body.


#gets called from the PlayerStateMachine to let the root know who the player node is
func set_player(node : Node) -> void:
	player_node = node
	player_node.get_node("Camera").current = true
	emit_signal("setPlayer")

# emits a signal for everyone and starts the takeover script
func player_dead(node: KinematicBody2D) -> void:
	revive -= 1
	if revive < 1:
		gameover = true
	emit_signal("playerDead", node)



func _process(_delta):
	if gameover:
		get_tree().reload_current_scene()
	if win:
		_winner()
		return
	if boss:
		if entitys.get_child_count() > 1:
			return
		if entitys.get_child(0) == player_node:
			win = true
			return
		gameover = true
		return
	if entitys.get_child_count() == 1:
		MusicController.play("res://Assets/Music/song_2.ogg")
		var witch_scene : PackedScene = load("res://Enemies/Witch/Witch.tscn")
		var witch : KinematicBody2D  = witch_scene.instance()
		witch.position = $Test_Level.get_node("WitchSpawn").global_position
		player_node.position = $Test_Level.get_node("PlayerSpawn").global_position
		boss = true
		entitys.add_child(witch)

#used to init the start_player
func _game_start()->void:
	var player_scene : PackedScene = load("res://Player/Start_Player.tscn")
	MusicController.play("res://Assets/Music/song_1.ogg")
	var player : KinematicBody2D = player_scene.instance()
	player.global_position = $Test_Level.get_node("StartSpawn").global_position
	entitys.add_child(player)
	$Hud.set_health_container()

func _winner()->void:
	$Hud.title_screen.visible = true
	$Hud.title_screen.get_node("WonTexture").visible = true
	$Hud.title_screen.get_node("Start").visible = false
	$Hud.title_screen.get_node("Start").disabled = true
	$Hud.title_screen.get_node("Quit").visible = false
	$Hud.title_screen.get_node("Quit").disabled = true
