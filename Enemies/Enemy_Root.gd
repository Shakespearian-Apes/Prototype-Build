extends Node

var player

func _ready():
	pass

func _process(delta):
	player = get_node_or_null("../Player_Root").get_child(0)
	if player == null:
		return
	for enemy in get_children():
		if enemy.see_player == true:
			var player_position = player.get_global_position()
			var enemy_position = enemy.get_global_position()
			var velocity = (player_position - enemy_position).normalized()
			if enemy_position.distance_to(player_position) <= 50:
				return
			else:
				enemy.move_and_slide(velocity * 200)
