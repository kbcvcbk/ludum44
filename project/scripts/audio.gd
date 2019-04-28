extends Node

var audio
#sfx
var sfx_door_open = [[0.5, 1.2], [1.5, 2.3]]
var sfx_door_close = [[2.8, 3.5], [4.7, 5.6], [5.8, 6.5]]

func play_sfx(sfx):
	var node
	var array
	match sfx:
		"door_open":
			node = audio.get_node("sfx/door")
			array = sfx_door_open
		"door_close":
			node = audio.get_node("sfx/door")
			array = sfx_door_close
	randomize()
	var idx = rand_range(0, len(array))
	node.play(array[idx][0])
	print(array[idx][0])
	yield(get_tree().create_timer(array[idx][1]-array[idx][0]+0.1), "timeout")
	print(array[idx][0]+array[idx][1]-array[idx][0]+0.1)
	node.stop()
	
