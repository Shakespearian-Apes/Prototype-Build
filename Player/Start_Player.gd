extends KinematicBody2D

var health = 3
const MAX_SPEED = 500
const ACCELERATION = 100
const FRICTION = 100

func _on_HurtBox_area_entered(_area):
	print(_area)

func take_damage(damage, enemy):
	health -= damage
	if health < 1:
		get_node("/root/Root").player_dead(enemy)
		queue_free()
