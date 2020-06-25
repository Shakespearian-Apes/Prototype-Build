extends KinematicBody2D

const MAX_HEALTH = 1
var start : bool = true
var is_attacking= false
var hit :bool = false
onready var health :int = MAX_HEALTH
onready var root : Node= get_node("/root/Root")
onready var player_detect : Area2D = $Player_Detection
onready var player : KinematicBody2D = root.player_node

func _ready():
	$Start.connect("timeout", self, "_start_timeout")
	$Lightning.get_node("Light1").connect("body_entered", self, "_on_hit_light")
	$Lightning.get_node("Light1").connect("body_exited", self, "_off_hit_light")
	$Lightning.get_node("Light2").connect("body_entered", self, "_on_hit_light")
	$Lightning.get_node("Light2").connect("body_exited", self, "_off_hit_light")
	player_detect.connect("body_entered", self, "_on_Player_Detection_body_entered")
	player_detect.connect("body_exited", self, "_on_Player_Detection_body_exited")
	$Start.start()
	$AnimationPlayer.play("Idle")

func _on_Player_Detection_body_entered(body):
	$Timer.start()
	is_attacking = true
	attack()


func _on_Player_Detection_body_exited(body):
	# $Timer.start()
	is_attacking = false
	attack()

func _start_timeout():
	start = false
func attack():
	var attack_number = random()
	if is_attacking == false:
		$AnimationPlayer.stop()
		$AnimationPlayer.play("Idle")
		$Lightning.visible = false
	elif is_attacking == true:
		$AnimationPlayer.play("lightning")
		$Lightning.visible = true

func _on_Timer_timeout():#
	hit = false
	# attack()

func random():
	var attack = randi()%3+1
	return attack


func _off_hit_light(body):
	if body == root.player_node:
		hit = false


func _on_hit_light(body):
	if start:
		return
	if hit :
		return
	if body == root.player_node:
		hit = true
		body.take_damage(1, self)

# weapons call this function on a body they detect
func take_damage(dmg : int, _attacker: Node)->void:
	print('est')
	if _attacker != root.player_node:
		return
	health -= dmg
	if health < 1:
		root.win = true
		queue_free()
