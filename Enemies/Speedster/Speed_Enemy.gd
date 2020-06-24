extends KinematicBody2D

var see_player = false
var player
var attack_ready = true;
const MAX_SPEED = 500
const ACCELERATION = 100
const FRICTION = 100

func _on_Player_Detection_area_entered(area):
	see_player = true

func _ready():
	$Sword.connect("AttackFinished", self, "reset_attack")

func _on_Player_Detection_area_exited(area):
	see_player = false

func _physics_process(delta):
	pass
	# player = get_node_or_null("../../Player_Root").get_child(0)
	# set_animation()

func set_animation():
	if player.get_global_position().x > get_global_position().x:
		$Sprite.set_scale(Vector2(1,1))
	elif player.get_global_position().x < get_global_position().x:
		$Sprite.set_scale(Vector2(-1,1))
	elif player.get_global_position().x == get_global_position().x:
		$Sprite.set_scale(Vector2(1,1))

func attack():
	if not attack_ready:
		return
	$Sword._change_state("attack")
	# $AnimationPlayer.play("attack")

func reset_attack():
	attack_ready = true;
