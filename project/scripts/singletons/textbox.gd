extends Node

var text_node
var queue : Array

func say(current_npc, thing):
	print("trying to speak!")
	var some = files.read_npc_db()
	if files.read_npc_db()[current_npc].get(thing) != null:
		print("not null!")
		var dialogue = files.read_npc_db()[current_npc][thing]
		queue = dialogue
		text_node.visible = true
	next()

func next():
	var label = text_node.get_node("NinePatchRect/MarginContainer/RichTextLabel")
	var next = queue.pop_front()
	if next != null:
		label.text = next.substr(4, len(next)-4) if "NPC" in next else next.substr(3, len(next)-3)
	else:
		text_node.visible = false