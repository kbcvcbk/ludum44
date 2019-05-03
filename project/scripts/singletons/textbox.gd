extends Node

var text_npc
var text_pc
var saying = false
var queue : Array

func say(current_npc, thing):
	saying = true
	var some = files.read_npc_db()
	if files.read_npc_db()[current_npc].get(thing) != null:
		var dialogue = Array(files.read_npc_db()[current_npc][thing])
		queue = dialogue
	next()

func next():
	var next = queue.pop_front()
	if text_pc.visible == true:
		text_pc.exit()
		yield(text_pc, "exited")
	if text_npc.visible == true:
		text_npc.exit()
		yield(text_npc, "exited")
	if next != null:
		if "NPC" in next:
			text_pc.visible = false
			var label = text_npc.get_node("NinePatchRect/MarginContainer/RichTextLabel")
			label.text = next.substr(4, len(next)-4)
			text_npc.visible = true
			text_npc.enter()
			yield(text_npc, "entered")
		elif "PC" in next:
			text_npc.visible = false
			var label = text_pc.get_node("NinePatchRect/MarginContainer/RichTextLabel")
			label.text = next.substr(3, len(next)-3)
			text_pc.visible = true
			text_pc.enter()
			yield(text_pc, "entered")
	else:
		saying = false
		text_npc.visible = false
		text_pc.visible = false