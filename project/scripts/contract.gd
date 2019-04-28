extends Area2D

onready var part_list = get_tree().get_nodes_in_group("contract_part")
var current_part = 0
var max_part = 6 #number of parts

func _ready():
	connect("area_entered", self, "_on_cursor_entered")
	connect("area_exited", self, "_on_cursor_exited")
	hide_all()

func _on_cursor_entered(cursor):
	if cursor.is_in_group("cursor") and cursor.item != null:
		cursor.item.connect("dropped", self, "_on_item_dropped")

func _on_cursor_exited(cursor):
	if cursor.is_in_group("cursor") and cursor.item != null:
		cursor.item.disconnect("dropped", self, "_on_item_dropped")

func _on_item_dropped(item):
		$particles.emitting = true
		show_next()
		item.visible = false
		yield(get_tree().create_timer(1.5), "timeout")
		item.queue_free()
		$particles.emitting = false

func hide_all():
	for part in part_list:
		part.visible = false

func show_next():
	if current_part >= max_part:
		current_part = 0
		hide_all()
	elif current_part == 4:
		part_list[4].visible = true
		part_list[5].visible = true
		current_part = 6
	else:
		var part = part_list[current_part]
		part.visible = true
		current_part += 1