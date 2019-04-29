extends Node

onready var animator
onready var contract
onready var puppeteer

func start_scene():
	var new = puppeteer.pool.keys()[int(rand_range(0, len(puppeteer.pool)))]
	animator.play("contract")
	puppeteer.enter_npc(new)
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
	textbox.say(current_npc, "entered_quote")