extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _draw():
	var j = 0 ;
	var x = 238
	for i in range(13) :
		j += 34
		x += 34
		draw_line(Vector2(8,j),Vector2(480,j),Color(0.34,0.01,0.01,1))
		draw_line(Vector2(j,8),Vector2(j,440),Color(0.34,0.01,0.01,1))
		draw_line(Vector2(8,x),Vector2(480,x),Color(0.34,0.01,0.01,1))
		draw_line(Vector2(j,8),Vector2(j,660),Color(0.34,0.01,0.01,1))
