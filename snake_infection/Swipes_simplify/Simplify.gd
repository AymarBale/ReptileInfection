extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal d
signal g
signal b
signal h
signal anima(a)
var initial = Vector2(0,0)
var final = Vector2(0,0)
var swipe
#onready var anim = get_parent().get_parent().get_node("buttons/AnimatedSprite")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event is InputEventScreenTouch:
		#if event.position.x > 187 && event.position.x < 550 && event.position.y > 911 && event.position.y < 800:
		#use this to check the size of the rect
			if initial == Vector2(0,0) :
				initial = event.position
				$begin.position = initial
				return
			if initial != Vector2(0,0) :
				final = event.position
				$final.position = final
			determine_swipe()
			reset()


func determine_swipe():
	swipe = final - initial
	if abs(swipe.x) > 3  || abs(swipe.y) > 3 :
		if abs(swipe.x) > abs(swipe.y):
			if swipe.x > 0:
				print("droite")
				emit_signal("d")
				emit_signal("anima",1)
			if swipe.x < 0:
				print("gauche")
				emit_signal("g")
				emit_signal("anima",3)
		if abs(swipe.x) < abs(swipe.y):
			if swipe.y > 0:
				print("bas")
				emit_signal("b")
				emit_signal("anima",2)
			if swipe.y < 0:
				print("haut")
				emit_signal("h")
				emit_signal("anima",0)
		pass
	pass

func reset():
	initial = Vector2(0,0)
	final = Vector2(0,0)
	pass
