extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_maze_body_exited(body):
	if get_tree():
		get_tree().reload_current_scene()
		print("lose")


func _on_win_box_body_entered(body):
	$Player.freeze = true
	$Player.position = Vector2(4333,234)
	await get_tree().create_timer(0.1).timeout
	$Player.freeze = false	
	
	#get_tree().reload_current_scene()
	var prtime
	print("win")
	



