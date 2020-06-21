extends KinematicBody2D


var health = 3

func _ready():
	pass 

func _process(delta):
	set_animation()

func set_animation():
	var parent = get_parent()
	if parent.velocity == Vector2.ZERO:
		$AnimationPlayer.play("idle")
	elif parent.velocity.x > 0:
		$Sprite.flip_h = false
		$AnimationPlayer.play("Walking")
	elif parent.velocity.x < 0:
		$Sprite.flip_h = true
		$AnimationPlayer.play("Walking")
	elif parent.velocity.y != 0:
		$AnimationPlayer.play("Walking")


func _on_HurtBox_area_entered(area):
	health -= 1
