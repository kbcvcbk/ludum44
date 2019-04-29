extends "res://scripts/generic/selectable.gd"

onready var current = null
var changing = false
var pool = {}
var past = [] #past 2 npcs

func _ready():
	storyteller.puppeteer = self
	for npc in get_tree().get_nodes_in_group("npc"):
		pool[npc.name] = npc

func _process(delta):
	if len(past) > 2:
		past.pop_back()
	if Input.is_action_just_pressed("ui_accept") and selected:
		storyteller.start()

func rotate_npcs(npcname):
	var new = pool[npcname]
	if !changing:
		changing = true
		if current != null:
			past.push_front(current)
			current.leave()
			yield(get_tree().create_timer(0.5), "timeout")
		current = new
		current.enter()
		textbox.say(files.read_npc_db()[npcname]["firstented_quote"])
		if npcname == "supla": audio.play_sfx("haha")
		yield(get_tree().create_timer(0.5), "timeout")
		files.read_npc_db()
		changing = false
