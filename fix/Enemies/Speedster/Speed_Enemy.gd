extends KinematicBody2D

var see_player = false
var player : Node
var attack_ready = true;

signal got_hit

const MAX_HEALTH = 4;
const MAX_SPEED = 500
const ACCELERATION = 100
const FRICTION = 100
onready var health = MAX_HEALTH
onready var root = get_node("/root/Root")

func _ready():
	$Player_Detection.connect("body_entered", self , "detection_entered")
	$Player_Detection.connect("body_exited", self , "detection_exited")
	$Sword.connect("AttackFinished", self, "reset_attack")

#checks if body that enters Detection is the Player
func detection_entered(body : Node):
	if body == root.player_node:
		see_player = true

#checks if the body that is leavin the Area is the Player
func detection_exited(body : Node):
	if see_player and (body == root.player_node):
		see_player = false

func _physics_process(_delta):
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

# relays the Damage handling to the StateMachine
func take_damage(dmg : int, enemy: Node)->void:
	emit_signal("got_hit",dmg, enemy)
