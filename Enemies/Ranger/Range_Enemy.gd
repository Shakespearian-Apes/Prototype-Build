extends KinematicBody2D

export var min_attack_dist :int = 150

var see_player = false
var player : Node
var attack_ready = true;

signal got_hit

const MAX_HEALTH = 2;
const MAX_SPEED = 400
const ACCELERATION = 100
const FRICTION = 100
onready var health = MAX_HEALTH
onready var root = get_node("/root/Root")
onready var rifle = $Flip.get_node("Rifle")

func _ready():
	$Player_Detection.connect("body_entered", self , "detection_entered")
	$Player_Detection.connect("body_exited", self , "detection_exited")
	rifle.connect("AttackFinished", self, "reset_attack")

#checks if body that enters Detection is the Player
func detection_entered(body : Node)->void:
	if body == root.player_node:
		see_player = true

#checks if the body that is leavin the Area is the Player
func detection_exited(body : Node)->void:
	if see_player and (body == root.player_node):
		see_player = false

func attack()->void:
	if not attack_ready:
		return
	rifle._change_state("attack")
	attack_ready = false
	# $AnimationPlayer.play("attack")

func reset_attack()->void:
	attack_ready = true;

# relays the Damage handling to the StateMachine
func take_damage(dmg : int, enemy: Node)->void:
	emit_signal("got_hit",dmg, enemy)
