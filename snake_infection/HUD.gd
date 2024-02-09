extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var p = load("res://pop_up.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$AdMob.load_banner()
	$AdMob.show_banner()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_frog_b_released():
	Global.x = 4
	Global.g = -8
	Global.t = 1.4
	var pop = p.instance()
	add_child(pop)
	pop.position = $pos/frog_p.position
	pop.a = "frog"
	yield(get_tree().create_timer(0.5), "timeout")
	$AdMob.hide_banner()
	get_tree().change_scene("res://ads/add_video.tscn")
	pass # Replace with function body.


func _on_python_b_released():
	Global.x = 5
	Global.g = -6
	Global.t = 1.2
	var pop = p.instance()
	add_child(pop)
	pop.position = $pos/python_p.position 
	pop.a = "python"
	yield(get_tree().create_timer(0.5), "timeout")
	$AdMob.hide_banner()
	get_tree().change_scene("res://ads/add_video.tscn")
	pass # Replace with function body.


func _on_zebra_b_released():
	Global.x = 7
	Global.g = -5
	Global.t = 1.1
	var pop = p.instance()
	add_child(pop)
	pop.position = $pos/zebra_p.position
	pop.a = "zebra"
	yield(get_tree().create_timer(0.5), "timeout")
	$AdMob.hide_banner()
	get_tree().change_scene("res://ads/add_video.tscn")
	pass # Replace with function body.


func _on_credits_released():
	get_tree().quit()
	pass # Replace with function body.




func _on_TouchScreenButton_pressed():
	get_node("/root/tutorial/Player")
	get_tree().change_scene("res://tutorial/tutorial.tscn")
	pass # Replace with function body.


func _on_donate_pressed():
	get_tree().change_scene("res://ads/add_video.tscn")
	pass # Replace with function body.
