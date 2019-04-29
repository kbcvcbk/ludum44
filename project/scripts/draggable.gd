extends "res://scripts/selectable.gd"

var held = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if selected and !held:
			held = true
			cursor.holding = true
			cursor.item = self
		elif held:
			cursor.emit_signal("dropped", self)
			held = false
			cursor.holding = false
			cursor.item = null