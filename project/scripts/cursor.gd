extends Node

signal dropped

var cn
var item
var selected = []

var selection_queue

func _process(delta):
	if cn != null: cn.position = cn.get_global_mouse_position()
	
	for i in range(len(selected)):
		if i == 0:
			selected[i].selected = true
		else: selected[i].selected = false

func select(obj):
	selected.push_front(obj)

func unselect(obj):
	var obji = selected.find(obj)
	selected[obji].selected = false
	selected.remove(obji)