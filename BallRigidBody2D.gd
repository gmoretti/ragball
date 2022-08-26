extends RigidBody2D

var buf_v
var buf2_v
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _integrate_forces(state):
   buf_v = linear_velocity
   buf2_v = buf_v
