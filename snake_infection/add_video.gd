extends Node2D


func _ready():
	$AdMob.load_rewarded_video()
	pass 


func _on_Close_pressed():
	yield(get_tree().create_timer(0.3), "timeout")
	get_tree().change_scene("res://Level.tscn")
	pass # Replace with function body.


func _on_watch_pressed():
	#yield(get_tree().create_timer(0.3), "timeout")
	$AdMob.show_rewarded_video()
	pass # Replace with function body.


func _on_AdMob_rewarded_video_opened():
	$ProgressBar.value += 1 
	pass # Replace with function body.


func _on_AdMob_rewarded_video_closed():
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().change_scene("res://Level.tscn")
	pass # Replace with function body.
