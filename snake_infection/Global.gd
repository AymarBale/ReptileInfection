extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var x 
var g 
var t 
var tutorial_done = 0
var tutorial_file = "user://tutorial.txt"

# Called when the node enters the scene tree for the first time.
func _ready():
	setup()
	pass # Replace with function body.

func setup():
	var f = File.new()
	if f.file_exists(tutorial_file):
		f.open(tutorial_file, File.READ)
		var content = f.get_as_text()
		tutorial_done = int(content)
		f.close()

func save_tutorial():
	var f = File.new()
	f.open(tutorial_file, File.WRITE)
	f.store_string(str(tutorial_done))
	f.close()

