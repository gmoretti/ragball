extends RigidBody2D

var max_speed = 500
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _integrate_forces(_state):
	if abs(get_linear_velocity().x) > max_speed:
		var new_speed = get_linear_velocity().normalized().x
		new_speed *= max_speed
		set_linear_velocity(Vector2(new_speed, get_linear_velocity().y))
