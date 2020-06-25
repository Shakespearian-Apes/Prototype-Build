extends Node

var full_heart = load("res://Hud/FullHeart.tscn")
var full_heart_name
var empty_heart = load("res://Hud/EmptyHeart.tscn")
var empty_heart_name
onready var root = get_parent()
onready var heart_row = $HudV.get_node("HeartRow")

# Called when the node enters the scene tree for the first time.
func _ready():
	root.connect("playerDead", self, "reset_health_container")
	set_health_container()

# adds full Hearts to the VerticalContainer
func set_health_container():
	var i = 0
	var hearts = root.player_node.MAX_HEALTH
	while i < hearts:
		var heart = full_heart.instance()
		full_heart_name = heart.get_texture()
		heart_row.add_child(heart)
		i+=1

#Emptys the Container so it doesnt show more Hearts as it should
func reset_health_container(_node):
	var hearts = heart_row.get_children()
	for heart in hearts:
		heart.queue_free()
	set_health_container()

#replaces the full heart containers with empty ones
func lost_health():
	var hearts = heart_row.get_children()
	for heart in hearts:
		if heart.get_texture() == full_heart_name:
			heart.queue_free()
			var empty = empty_heart.instance()
			heart_row.add_child(empty)
			return

