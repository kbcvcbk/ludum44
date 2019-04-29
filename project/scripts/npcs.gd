extends "res://scripts/selectable.gd"

onready var npcs = get_tree().get_nodes_in_group("npc")
onready var current = null
onready var tween = Tween.new()

func _ready():
	add_child(tween)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and selected:
		rotate_npcs()

func rotate_npcs():
	Background.toggle_door()
	if current != null:
		var scroll = 100
		var duration = 0.7
		var init_pos = current.position
		tween.interpolate_property(current, "modulate:a",
				1, 0, duration,
				Tween.TRANS_QUAD, Tween.EASE_OUT)
		tween.interpolate_property(current, "position:x",
				current.position.x, current.position.x-scroll, duration,
				Tween.TRANS_CUBIC, Tween.EASE_OUT)
		tween.start()
		yield(tween, "tween_completed")
		current.visible = false
		current.position = init_pos
	yield(get_tree().create_timer(0.3), "timeout")
	randomize()
	var new = rand_range(0, len(npcs))
	current = npcs[new]
	var scroll = 100
	var duration = 0.7
	var init_pos = current.position
	current.modulate.a = 0
	current.position.x -= scroll
	tween.interpolate_property(current, "modulate:a",
			0, 1, duration,
			Tween.TRANS_QUAD, Tween.EASE_OUT)
	tween.interpolate_property(current, "position:x",
			current.position.x, current.position.x+scroll, duration,
			Tween.TRANS_CUBIC, Tween.EASE_OUT)
	tween.start()
	current.visible = true
	yield(tween, "tween_completed")
	Background.toggle_door()
	current.position = init_pos
