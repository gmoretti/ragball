extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$background/waterPlayer.play("waves")
	$background/cloudPlayer.play("clouds")
	$AnimationPlayer.play("title")
	$title_music.play()
	$waves_sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://world.tscn")


func _on_Quit_pressed():
	get_tree().quit()
