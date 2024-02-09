extends Area2D

signal Gear_used
signal add_orbs

func _ready():
	pass 

func _on_Gear_area_entered(area):
	if(area.name == "Head"):
		get_parent().gear_nbr -= 1
		queue_free()
		emit_signal("Gear_used")
		emit_signal("add_orbs")
	pass 
