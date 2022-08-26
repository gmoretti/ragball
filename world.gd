extends Node2D

var ball_scene =  preload("res://ball.tscn")
var menu_scene =  preload("res://menu.tscn").instance()

var points = 0
var highestscore = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	loadHighestScore()
	$hightScore.text = str(highestscore)
	$nPoints.text = str(points)
	$background/waterPlayer.play("waves")
	$background/cloudPlayer.play("clouds")
	$Timer.start()
	$waves_sound.play()

func _on_Area2D_body_entered(body):
	if (body.is_in_group("ball")):
		# Disable the goal area to avoid multiple bouncing goals
		call_deferred("changeColisionGoal", true) 
		points += 1
		$nPoints.text = str(points)
		$PointsSound.play()
		$ScoreAnimation.play("scoreGoal")
		
func changeColisionGoal(disabled):
	$goalArea/CollisionShape2D.disabled = disabled

func _on_ball_dissapearArea_body_entered(body):
	if (body.is_in_group("ball")):
		# Once the blal dissapear re enable goal collision
		call_deferred("changeColisionGoal", false) 
		body.queue_free()
		var new_ball = ball_scene.instance()
		new_ball.position = Vector2(100,100)
		call_deferred("add_child", new_ball)

func _process(delta):
	$time_left.text = str(int($Timer.time_left))


func _on_Timer_timeout():
	get_tree().paused = true
	$ranking/Panel.show()
	$ranking/Panel/score.text = str(points)
	
	if (points > highestscore):
		highestscore = points
		saveHighestScore(highestscore)

func saveHighestScore(highestscore):
	var save_game = File.new()
	save_game.open("user://game.data", File.WRITE)
	save_game.store_line(to_json(highestscore))
	save_game.close()

func loadHighestScore():
	var save_game = File.new()
	if save_game.file_exists("user://game.data"):
		save_game.open("user://game.data", File.READ)
		highestscore = parse_json(save_game.get_line())
		save_game.close()
