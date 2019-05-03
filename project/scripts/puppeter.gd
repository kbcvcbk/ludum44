extends "res://scripts/generic/selectable.gd"

signal npc_entered
signal npc_exited

onready var current = null
var changing = false
var pool = {}

func _ready():
	storyteller.puppeteer = self
	for npc in get_tree().get_nodes_in_group("npc"):
		pool[npc.name] = npc

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and selected:
		if current == null:
			storyteller.start_scene()
		elif textbox.saying:
			textbox.next()
		else:
			storyteller.interact()

func exit_npc():
		if current != null:
			current.leave()
			yield(get_tree().create_timer(0.5), "timeout")
			emit_signal("npc_exited")

func enter_npc(npcname):
	var new = pool[npcname]
	if !changing:
		changing = true
		current = new
		current.enter()
		yield(get_tree().create_timer(0.5), "timeout")
		emit_signal("npc_entered")
		changing = false
