extends Node2D

var power = 5000
var can_jump = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		$torso.apply_impulse(Vector2.ZERO, Vector2.UP * power)
	
	if Input.is_action_just_pressed("ui_down"):
		$torso.apply_impulse(Vector2.ZERO, Vector2.DOWN * power)
		
	if Input.is_action_just_pressed("ui_left"):
		$torso.apply_impulse(Vector2.ZERO, Vector2.LEFT * power)
	
	if Input.is_action_just_pressed("ui_right"):
		$torso.apply_impulse(Vector2.ZERO, Vector2.RIGHT * power)
		
	if Input.is_action_just_pressed("kick"):
		$leg_right.apply_impulse(Vector2.ZERO, Vector2.RIGHT * power/2)
