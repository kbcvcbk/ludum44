extends "res://scripts/selectable.gd"

signal dropped

onready var starting_pos = self.position
onready var cursor = get_tree().get_nodes_in_group("cursor")[0]
var clicked = false
var click_timer

func _input(event):
	if selected:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
			if event.pressed and !self.clicked:
				self.clicked = true
				cursor.clicking = true
				cursor.item = self
			elif event.pressed and self.clicked:
				self.clicked = false
				cursor.clicking = false
				emit_signal("dropped", self)
				cursor.item = null

func _process(delta):
	if self.clicked:
		global_position = get_global_mouse_position()
	else:
		position = starting_pos