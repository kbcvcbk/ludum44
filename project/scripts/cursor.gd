extends Area2D

signal mouse_dropped

var item
var clicking = false
var was_click = false

func _process(delta):
	self.position = get_global_mouse_position()
	if clicking and !was_click:
		was_click = clicking
	elif was_click and !clicking:
		was_click = clicking
		print("dropped")
		emit_signal("mouse_dropped", item)