extends Node2D

onready var gear = preload("res://Gear.tscn")
var level = 0
var score = 0
var orbs_num = 0
var next_level = 10
var gear_nbr = 0
var b = load("res://blast.tscn")
var s = load("res://Snake.tscn")
var ingame = false
onready var go = $Game_over
var ads = 0

func _ready():
	#Global.tutorial_done = 0
	#Global.save_tutorial()
	get_node("Snake")._ready()
	print(Global.tutorial_done)


func start():
	ingame = true
	$Timer.set_wait_time(Global.t)
	get_node("Snake").set_process(true)
	$Asker.hide()
	add_gear()
	$Game_over.hide()
	pass # Replace with function body.

func _process(delta):
	if Global.tutorial_done == 0:
		get_tree().paused = true
		$tuto/tutorial/back.hide()
		$tuto/tutorial/Light2D.show()
		$tuto/tutorial/Light2D2.show()
	if Global.tutorial_done == 1:
		$tuto.hide()
		pass
	$text/Score.text = "Points :"+ str(score)
	$text/l.text = "orbs:"+ str(orbs_num)
	$text/la.text = "level:"+ str(level)
	$text/lab.text = "for lvup:"+ str(next_level)
	$Snake/Head.position.x = wrapf($Snake/Head.position.x, 45, 675)
	$Snake/Head.position.y = wrapf($Snake/Head.position.y, 158, 1050)
	if get_node("Snake").i < 0 :
			get_node("Snake").i = 1

func add_gear():
	while gear_nbr < 2:
		var instance = gear.instance()
		instance.position = Vector2(rand_range(38,507),rand_range(134,775))
		instance.connect("Gear_used",self,"spawn_new")
		instance.connect("add_orbs",self,"level_count")
		add_child(instance)
		gear_nbr += 1

func level_count():
	if orbs_num < next_level:
		orbs_num += 1
	if orbs_num == next_level:
		level += 1
		get_node("Snake")._cured()
		$Timer.stop()
		next_level += 10 + level*2
		yield(get_tree().create_timer(1.5), "timeout")
		orbs_num += 1
		$Timer.start()
	pass

func spawn_new():
	score += 5
	add_gear()
	get_node("Snake").add_tail()


func _on_Timer_timeout():
	get_node("Snake").infection()
	pass # Replace with function body.



func _on_borders_area_entered(area):
	pass # Replace with function body.

func blast():
	var buzz = b.instance()
	add_child(buzz)
	pass

func game_over():
	pass


