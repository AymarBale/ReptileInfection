extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Panel/Label2/Panel2/CGB01-red_S_rounded_btn5").modulate = Color(150,75,0)
	get_node("Panel/Label2/Panel3/CGB01-red_S_rounded_btn5").modulate = Color(150,75,0)
	get_node("Panel/Label2/Panel3/CGB01-red_S_rounded_btn4").modulate = Color(150,75,0)
	get_node("Panel/Label2/Panel3/CGB01-red_S_rounded_btn3").modulate = Color(150,75,0)
	get_node("Panel/Label2/Panel3/CGB01-red_S_rounded_btn2").modulate = Color(150,75,0)
	get_node("Panel/Label2/Panel3/CGB01-red_S_rounded_btn6").modulate = Color(150,75,0)
	get_node("Panel/Label2/Panel3/CGB01-red_S_rounded_btn").modulate = Color(150,75,0)
	get_node("Panel/Label2/Panel3/CGB01-blue_S_rounded_btn").modulate = Color(150,75,0)
	get_node("Panel/Label3/Panel/infected").modulate = Color(150,75,0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TouchScreenButton_pressed():
	if get_tree().get_current_scene().get_name() != "tutorial":
		Global.tutorial_done = 1
		Global.save_tutorial()
		get_tree().paused = false
		queue_free()
	if get_tree().get_current_scene().get_name() == "tutorial":
		get_tree().change_scene("res://Level.tscn")
	pass # Replace with function body.
