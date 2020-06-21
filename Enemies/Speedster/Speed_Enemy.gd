extends KinematicBody2D

var see_player = false

func _on_Player_Detection_area_entered(area):
	see_player = true


func _on_Player_Detection_area_exited(area):
	see_player = false

func _physics_process(delta):
	pass
