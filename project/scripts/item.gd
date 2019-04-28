extends "res://scripts/draggable.gd"

var looping : bool = false
var scale_sel = Vector2(1.1, 1.1)
var scale_unsel = Vector2(1, 1)
var freq = 0.7

onready var me = self
onready var tween = Tween.new()

func _ready():
	add_child(tween)

func _process(delta):
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
	if !selected and looping: # se n ta selecionado e tá anim
		looping = false
		tween.stop_all()
		tween.interpolate_property(self, "scale",
				me.scale, scale_unsel, freq,
				Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		tween.start()
		
	