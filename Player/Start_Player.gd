extends KinematicBody2D


var health = 3


func _on_HurtBox_area_entered(_area):
	print(_area)
	health -= 1
