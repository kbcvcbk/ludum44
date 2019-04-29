extends Node

var audio_node

func play_sfx(sfx):
	var node = audio_node.get_node("sfx/"+sfx)
	print(node)
	node.play()
