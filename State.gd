extends Node
class_name State

onready var parent : Node = get_parent()
onready var flip : Node = parent.get_parent().get_node("Flip")
onready var animated_sprite : AnimatedSprite = flip.get_node("AnimatedSprite")
# onready var sprite_scale = animated_sprite.get_scale()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func enter(_machine):
	pass

func exit(_machine):
	pass
