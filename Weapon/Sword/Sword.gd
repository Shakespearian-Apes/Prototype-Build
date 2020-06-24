extends Area2D

signal AttackFinished

export(int) var damage = 1


var hit : bool = false
# enum STATES {IDLE, ATTACK}
var current_state = "idle"

onready var animation_player = $AnimationPlayer

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
			animation_player.play("attack")

func _physics_process(_delta):
	if hit:
		return
	var overlapping_bodies = get_overlapping_bodies()
	if not overlapping_bodies:
		return
	for body in overlapping_bodies:
		if not body.is_in_group("character"):
			return
		if is_owner(body):
			return
		body.take_damage(damage, get_parent())
		hit = true 
	set_physics_process(false)

# small check just to dont kill your self with it
func is_owner(node):
	return node == get_parent()

func _on_AnimationPlayer_animation_finished(name):
	if name == "attack":
		_change_state("idle")
		hit = false
		emit_signal("AttackFinished")
