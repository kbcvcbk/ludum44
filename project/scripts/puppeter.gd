extends "res://scripts/selectable.gd"

onready var npcs = get_tree().get_nodes_in_group("npc")
onready var current = null
var changing = false
var past = [] #past 2 npcs

func _process(delta):
#	for npc in npcs:
#		if npc == current:
#			npc.visible = true
#		else:
#			npc.visible = false
	if len(past) > 2:
		past.pop_back()
	if Input.is_action_just_pressed("ui_accept") and selected:
		if !changing:
			rotate_npcs()

func rotate_npcs():
	changing = true
	if current != null:
		past.push_front(current)
		current.leave()
		yield(get_tree().create_timer(0.5), "timeout")
	randomize()
	var new = rand_range(0, len(npcs))
	current = npcs[new]
	current.enter()
	yield(get_tree().create_timer(0.5), "timeout")
	changing = false
