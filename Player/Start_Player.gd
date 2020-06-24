extends KinematicBody2D

signal got_hit

var health = 3
const MAX_HEALTH = 3
const MAX_SPEED = 500
const ACCELERATION = 100
const FRICTION = 100

func _on_HurtBox_area_entered(_area):
	# print(_area)
	pass

# relays the Damage handling to the StateMachine
func take_damage(dmg : int, enemy: Node)->void:
	emit_signal("got_hit",dmg, enemy)

func _process(delta):
	print(health)
