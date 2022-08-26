extends Node2D



func _on_RigidBody2D_body_entered(body):
	if body.is_in_group("floor"):
		get_parent().call_deferred("changeColisionGoal", false) 
	print($RigidBody2D.buf2_v.length())
	if ($RigidBody2D.buf2_v.length() > 100 and !$AudioStreamPlayer2D.is_playing()):
		$AudioStreamPlayer2D.play()	

