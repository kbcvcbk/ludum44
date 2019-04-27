extends "res://scripts/selectable.gd"

onready var part_list = get_tree().get_nodes_in_group("contract_part")
var current_part = 0
var max_part = 6 #number of parts

func _ready():
	hide_all()

func hide_all():
	for part in part_list:
		part.visible = false

func show_next():
	if current_part >= max_part:
		current_part = 0
		hide_all()
	else:
		var part = part_list[current_part]
		print("name: "+part.name)
		print("idx: "+str(part.get_index()))
		part.visible = true
		print("-----------")
		current_part += 1