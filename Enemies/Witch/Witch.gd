extends Sprite

var is_attacking = false
onready var root : Node= get_node("/root/Root")
onready var player : KinematicBody2D = root.player_node

func _ready():
	$AnimationPlayer.play("Idle")

func _process(delta):
	pass


func _on_Player_Detection_body_entered(body):
	$Timer.start()
	is_attacking = true
	attack()


func _on_Player_Detection_body_exited(body):
	$Timer.start()
	is_attacking = false
	attack()

func attack():
	var attack_number = random()
	print(attack_number)
	if is_attacking == false:
		$AnimationPlayer.stop()
		$AnimationPlayer.play("Idle")
		$Lightning.visible = false
	elif is_attacking == true:
		$AnimationPlayer.play("lightning")
		$Lightning.visible = true

func _on_Timer_timeout():
	attack()

func random():
	var attack = randi()%3+1
	return attack


func _on_Area2D_body_entered(body):
	body.take_damage(1, self)


func _on_Area2D2_body_entered(body):
	body.take_damage(1, self)
