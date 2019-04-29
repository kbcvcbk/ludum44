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
			if door.open:
				audio.play_sfx("door_open")
			else:
				audio.play_sfx("door_close")
		"open":
			door.open = true
			audio.play_sfx("door_open")
		"close":
			door.open = false
			audio.play_sfx("door_close")

func refresh():
	props = get_tree().get_nodes_in_group("prop")
	for node in props:
		match node.name:
			"porta":
				door = node
