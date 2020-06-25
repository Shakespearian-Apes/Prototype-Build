extends RigidBody2D

const PROJECTILE_SPEED = 600

var damage
var creator
var velocity : Vector2 = Vector2.ZERO

func _ready():
	connect("body_entered", self, "_on_impact")

# func _physics_process(delta):
# 	var collide = get_colliding_bodies()
	

func _on_impact(body : Node):
	if body.is_in_group("character"):
		body.take_damage(damage, creator)
	queue_free()
