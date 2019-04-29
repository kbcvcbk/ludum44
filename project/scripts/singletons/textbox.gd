extends Node

var text_node
var queue : Array

func say(dialogue):
	queue = dialogue
	text_node.visible = true
	next()

func next():
	var label = text_node.get_node("NinePatchRect/MarginContainer/RichTextLabel")
	var next = queue.pop_front()
	if next != null:
		label.text = next
	else:
		text_node.visible = false