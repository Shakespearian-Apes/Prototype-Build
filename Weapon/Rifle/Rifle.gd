extends Node2D


signal AttackFinished

export(int) var damage : int = 1
export(int) var bullet_speed : int = 600


var hit : bool = false
var current_state = "idle"

onready var animation_player : AnimationPlayer = $AnimationPlayer
onready var parent : KinematicBody2D = get_parent().get_parent()
onready var bullet : PackedScene = load("res://Weapon/Rifle/Projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	animation_player.connect("animation_finished", self, "_on_AnimationPlayer_animation_finished")


func attack():
	_change_state("attack")

func _change_state(new_state):
	current_state = new_state
	match current_state:
		"idle":
			set_physics_process(false)
		"attack":
			set_physics_process(true)
			_shoot()
			animation_player.play("attack")

func _shoot()->void:
	var bullet_instance : RigidBody2D = bullet.instance()
	bullet_instance.position = $BulletSpawn.global_position
	print(bullet_instance.position)
	print($BulletSpawn.global_position)
	var direction = parent.get_node("Flip").get_scale()
	bullet_instance.apply_central_impulse(Vector2(direction.x * bullet_speed , 0))
	parent.add_child(bullet_instance)

func _physics_process(_delta):
	if hit:
		return
	# var overlapping_bodies = get_overlapping_bodies()
	# if not overlapping_bodies:
	# 	return
	# for body in overlapping_bodies:
	# 	if not body.is_in_group("character"):
	# 		return
	# 	if is_owner(body):
	# 		return
	# 	body.take_damage(damage, parent)
	# 	hit = true 
	# set_physics_process(false)

# small check just to dont kill your self with it
func is_owner(node):
	return node == parent

func _on_AnimationPlayer_animation_finished(name):
	if name == "attack":
		_change_state("idle")
		hit = false
		emit_signal("AttackFinished")
