extends RigidBody2D

const PROJECTILE_SPEED = 600

var velocity : Vector2 = Vector2.ZERO


func _physics_process(delta):
	var bodies = get_colliding_bodies()
	if not bodies:
		return
	print(bodies)

func _on_impact(normal : Vector2):
	pass