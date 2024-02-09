extends Node2D


func _on_x_button_pressed():
	if get_parent().ingame:
		ingame()
		return
	if get_parent().ingame == false:
		get_parent().start()
		#get_node("x_button").set_block_signals(true)
	pass # Replace with function body.

func ingame():
	get_tree().reload_current_scene()
	get_parent().start()
	pass

func _on_o_button_pressed():
	yield(get_tree().create_timer(0.25), "timeout")
	get_tree().paused = false
	get_tree().change_scene("res://HUD.tscn")
	pass # Replace with function body.


func _on__button_pressed():
	yield(get_tree().create_timer(0.25), "timeout")
	pause()
	pass # Replace with function body.

func pause():
	if get_tree().paused == false:
		get_tree().paused = true
		$"[]_button/pause".text = "unpause"
		$"[]_button/Node2D".show()
		return
	if get_tree().paused == true:
		get_tree().paused = false
		$"[]_button/pause".text = "pause"
		$"[]_button/Node2D".hide()
		return


func _on_Simplify_anima(a):
	if a == 0:
		$AnimatedSprite.play("haut")
	if a == 1:
		$AnimatedSprite.play("droite")
	if a == 2:
		$AnimatedSprite.play("bas")
	if a == 3:
		$AnimatedSprite.play("gauche")
	pass # Replace with function body.
