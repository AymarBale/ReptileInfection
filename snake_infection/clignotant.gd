extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var initial = $Position2D.position
onready var final = $Position2D2.position
onready var tween = get_node("Tween")
func _ready():
	aller()
	pass
func aller():
	tween.interpolate_property($signe, "position",initial, final, 1,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween,"tween_completed")
	retour()

func retour():
	tween.interpolate_property($signe, "position",final, initial, 1,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween,"tween_completed")
	aller()
