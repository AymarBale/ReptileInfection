extends Area2D

var cur_dir = Vector2(0,0)
var directions = []
var pos_array = []
var infected = false
var b = load("res://blast.tscn")
signal del(x)
func _process(delta):
	position.x = wrapf(position.x, 45, 675)
	position.y = wrapf(position.y, 158, 1050)
	if infected:
		self.modulate = Color(150,75,0)
	if infected == false:
		self.modulate = Color(1,1,1)
	position += cur_dir#cur_dir/2
	if(directions.size() > 0):
		if(position == pos_array[0]):
			cur_dir = directions[0]
			remove_from_tail()


func remove_from_tail():
	directions.pop_front()
	pos_array.pop_front()

func add_to_tail(head_pos,dir):
	pos_array.append(head_pos)
	directions.append(dir)
	
func _on_Tail_area_entered(area):
	if(area.name == "Head"):
		if infected :
			get_parent().get_parent().blast()
			emit_signal("del",self)
		if infected == false:
			get_parent().get_parent().ads += 1
			get_parent().get_parent().get_tree().reload_current_scene()
			print("jab")
			pass
	if(area.name == "walls"):
		#get_tree().quit()
		pass
	pass # Replace with function body.
