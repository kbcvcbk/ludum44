extends Node

var props
var door

func _ready():
	refresh()

func toggle_door(how=null):
	refresh()
	match how:
		null:
			door.open = !door.open
		"open":
			door.open = true
		"close":
			door.open = false

func refresh():
	props = get_tree().get_nodes_in_group("prop")
	for node in props:
		match node.name:
			"porta":
				door = node
