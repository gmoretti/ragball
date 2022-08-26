extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") and get_tree().paused == false:
		show()
		get_tree().paused = true

	elif Input.is_action_just_pressed("ui_cancel") and get_tree().paused == true:
		hide()
		get_tree().paused = false

func _on_exit_button_pressed():
	get_tree().quit()

func _on_full_screen_toggled(button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen
