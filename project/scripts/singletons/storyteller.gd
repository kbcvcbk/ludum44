extends Node

onready var animator
onready var contract
onready var puppeteer

var past_npcs = Array()

func start_scene():
	var npcs = puppeteer.pool.keys()
	randomize()
	var new = npcs[randi() % len(npcs)]
	while new in past_npcs:
		new = npcs[randi() % len(npcs)]
	animator.play("contract")
	puppeteer.enter_npc(new)
	past_npcs.append(new)
	yield(puppeteer, "npc_entered")
	interact()
	yield(animator, "animation_finished")

func end_scene():
	animator.play("sealed")
	yield(get_tree().create_timer(1.1), "timeout")
	textbox.queue = []
	textbox.next()
	puppeteer.exit_npc()
	yield(animator, "animation_finished")
	contract.hide_all()
	start_scene()

func interact(item=null):
	var current_npc = puppeteer.current.name
	if current_npc == "supla": audio.play_sfx("haha")
	if item == null:
		textbox.say(current_npc, "entered_quote")
	else:
		print("interacting with "+item.name)
		textbox.say(current_npc, item.name)