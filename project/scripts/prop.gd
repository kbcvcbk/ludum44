extends Node

var props
var door

func _ready():
	refresh()

func toggle_door():
	refresh()
	door.open = !door.open
	if door.open:
		audio.play_sfx("door_open")
	else:
		audio.play_sfx("door_close")

func refresh():
	props = get_tree().get_nodes_in_group("prop")
	for node in props:
		match node.name:
			"porta":
				door = node
