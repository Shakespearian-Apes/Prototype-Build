extends Node

signal game_start

var full_heart = load("res://Hud/FullHeart.tscn")
var full_heart_name
var empty_heart = load("res://Hud/EmptyHeart.tscn")
var empty_heart_name
var full_ankh = load("res://Hud/FullAnkh.tscn")
var empty_ankh = load("res://Hud/EmptyAnkh.tscn")
onready var root = get_parent()
onready var heart_row = $HudV.get_node("HeartRow")
onready var revive_row = $HudV.get_node("ReviveRow")
onready var title_screen : TextureRect= $TitleScreen

# Called when the node enters the scene tree for the first time.
func _ready():
	root.connect("playerDead", self, "reset_health_container")
	title_screen.get_node("Start").connect("pressed", self, "pressed_start")
	title_screen.get_node("Quit").connect("pressed", self, "pressed_quit")

# adds full Hearts to the VerticalContainer
func set_health_container()->void:
	var i = 0
	var hearts = root.player_node.MAX_HEALTH
	while i < hearts:
		var heart = full_heart.instance()
		full_heart_name = heart.get_texture()
		heart_row.add_child(heart)
		i+=1

#Emptys the Container so it doesnt show more Hearts as it should
func reset_health_container(_node : Node)->void:
	_lost_revive()
	var hearts = heart_row.get_children()
	for heart in hearts:
		heart.queue_free()
	set_health_container()

#replaces the full heart containers with empty ones
func lost_health()->void:
	var hearts = heart_row.get_children()
	for heart in hearts:
		if heart.get_texture() == full_heart_name:
			heart.queue_free()
			var empty = empty_heart.instance()
			heart_row.add_child(empty)
			return

#set start revive icons
func _set_revives()->void:
	var i = 0
	while i < root.revive:
		var ankh = full_ankh.instance()
		revive_row.add_child(ankh)
		i+=1

#removes first child and replaces it with new icon
func _lost_revive()->void:
	revive_row.get_child(0).queue_free()
	var ankh = empty_ankh.instance()
	revive_row.add_child(ankh)

#gets Called when user pressed start emits signal to the root
func pressed_start()->void:
	title_screen.visible = false
	_set_revives()
	emit_signal("game_start")

#gets called on press quit and does just that
func pressed_quit():
	get_tree().quit()
