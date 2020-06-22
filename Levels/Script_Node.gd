extends Node

#Player vars
var player
var player_health
var chip 
var can_move = true

func _ready():
	pass

func _process(delta):
	pass
	# get_variables()
	# player_hurt()

func player_hurt():
	if player_health <= 0:
		throw_chip()

func throw_chip():
	chip.visible = true
	chip.set_global_position(player.get_global_position())
	can_move = false

func get_variables():
	chip = get_node_or_null("../Chip")
	player = get_node_or_null("../Player_Root").get_child(0)
	player_health = player.health
