extends Node

onready var init_pos = self.position
var scroll = 100
var duration = 0.7

onready var tween = Tween.new()

func _ready():
	add_child(tween)

func enter():
	control.toggle_door("open")
	self.modulate.a = 0
	self.position.x -= scroll
	tween.interpolate_property(self, "modulate:a",
			0, 1, duration,
			Tween.TRANS_QUAD, Tween.EASE_OUT)
	tween.interpolate_property(self, "position:x",
			self.position.x, init_pos.x, duration,
			Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()
	self.visible = true
	yield(tween, "tween_completed")
	control.toggle_door("close")
	self.position = init_pos

func leave():
	tween.interpolate_property(self, "modulate:a",
			1, 0, duration,
			Tween.TRANS_QUAD, Tween.EASE_OUT)
	tween.interpolate_property(self, "position:x",
			init_pos.x, self.position.x-scroll, duration,
			Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()
	control.toggle_door("open")
	yield(tween, "tween_completed")
	control.toggle_door("close")
	self.visible = false
	self.position = init_pos