extends Node2D

var direction = Vector2(2,0)#Vector2(5,0)
var gap = Global.g
var next_tail_dir = Vector2(1,0)
var prev_dir = Vector2(1,0)
var i = 1
var del 
var aim = 0
var direct = 0
var instance
var x = Global.x
onready var tail = preload("res://Tail.tscn")
var infected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(direct == 0) && aim == 0:#"haut"ui_up
		direction = Vector2(0,-x)
		aim = 1
		pass
	elif(direct == 2)&& aim == 0:#"bas""ui_down"
		direction = Vector2(0,x)
		aim = 1
		pass
	elif(direct == 3)&& aim == 1:#"gauche""ui_left"
		direction = Vector2(-x,0)
		aim = 0
		pass
	elif(direct == 1)&& aim == 1:#"droite""ui_right"
		direction = Vector2(x,0)
		aim = 0
		pass
	move_snake()
	if i == 0 :
			i = 1
	pass


func move_snake():
	var head_pos = get_node("Head").position
	get_node("Head").position += direction#direction/2
	var dir_change = false
	if(prev_dir != direction):
		prev_dir = direction
		dir_change = true
	if(dir_change == true):
		for i in range(1, get_child_count()):
			get_child(i).add_to_tail(head_pos,direction)
			pass
	
func add_tail():
	instance = tail.instance()
	var prev_tail = get_child(get_child_count()-1)
	if prev_tail.name !="Head":
		instance.cur_dir = prev_tail.cur_dir
		for i in range(0,prev_tail.pos_array.size()):
			instance.pos_array.append(prev_tail.pos_array[i])
			instance.directions.append(prev_tail.directions[i])
		instance.position = prev_tail.position + prev_tail.cur_dir * gap
		if prev_tail.infected :
			instance.infected = true
			if get_child_count() > 6:
				get_child(get_child_count()-i+1).infected = false
				#get_child(5).infected = false
				pass
	else:
		instance.cur_dir = direction
		instance.position = prev_tail.position + direction * gap
	instance.connect("del",self,"murdermass")
	add_child(instance)
	if get_child_count() == 7:
		get_parent().get_node("Timer").start()

func infection():
	if get_child_count() > 6:
		if i >= get_child_count():#if get_child(0).infected :
			$Head.modulate = Color(150,75,0)
			set_process(false)
			yield(get_tree().create_timer(1), "timeout")
			get_parent().game_over()
		get_child(get_child_count()-i).infected = true
		i += 1
	if get_node("Head").infected:
				game_over()
				get_parent().game_over()
				get_parent().ads += 1
				get_tree().reload_current_scene()
				
	else:
		pass
func _cured():
		for n in get_children():
			n.infected = false
			i -= 1
func murdermass(x):
	del = x.get_index()
	get_child(del).queue_free()
	for n in get_children():
		if n.get_index() >= del :
			remove_child(n)
			n.queue_free()
			i -= 1
	pass

func game_over():
	set_process(false)
	pass


func _on_Simplify_b():
	if aim == 0:
		direct = 2
	pass # Replace with function body.


func _on_Simplify_d():
	if aim == 1:
		direct = 1
	pass # Replace with function body.


func _on_Simplify_g():
	if aim == 1:
		direct = 3
	pass # Replace with function body.



func _on_Simplify_h():
	if aim == 0:
		direct = 0
	pass # Replace with function body.




	
