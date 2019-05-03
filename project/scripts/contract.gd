extends "res://scripts/generic/selectable.gd"

onready var part_list = get_tree().get_nodes_in_group("contract_part")
var current_part = 0
var max_part = 6 # number of parts

func _ready():
	storyteller.contract = self
	cursor.connect("dropped", self, "_on_item_dropped")
	hide_all()

func _process(delta):
	if selected and Input.is_action_just_pressed("ui_accept"):
		if $header/seal.visible:
			storyteller.end_scene()
		elif $header/content.visible:
			show_sign()

func _on_item_dropped(item):
	if selected:
		show_content(item)
		storyteller.interact(item)
		item.visible = false
		yield(get_tree().create_timer(1.5), "timeout")
		item.queue_free()

func show_content(item):
	$particles.emitting = false
	$particles.emitting = true
	$header/content.visible = true
	
func show_sign():
	$particles.emitting = false
	$particles.emitting = true
	$header/seal.visible = true

func hide_all():
	$header/content.visible = false
	$header/seal.visible = false

