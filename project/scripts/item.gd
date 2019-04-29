extends "res://scripts/draggable.gd"

var looping : bool = false

var freq = 0.7
onready var scale_sel = self.scale*1.1
onready var scale_unsel = self.scale

onready var start_pos = self.position
onready var tween = Tween.new()

func _ready():
	add_child(tween)

func _process(delta):
	if held:
		global_position = get_global_mouse_position()
	else:
		position = start_pos
		if selected and !looping: # se n tá anim e objeto selecionado
			tween.stop_all()
			looping = true
			tween.interpolate_property(self, "scale",
					self.scale, scale_sel, freq,
					Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			tween.start()
			if looping == true:
				yield(tween, "tween_completed")
				tween.interpolate_property(self, "scale",
						self.scale, scale_unsel, freq,
						Tween.TRANS_SINE, Tween.EASE_IN_OUT)
				tween.start()
				yield(tween, "tween_completed")
				looping = false
		elif !selected and looping: # se n ta selecionado e tá anim
			looping = false
			tween.stop_all()
			tween.interpolate_property(self, "scale",
					self.scale, scale_unsel, freq,
					Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			tween.start()
