extends Node

onready var animator
onready var contract
onready var textbox
onready var puppeteer

func start():
	var new = puppeteer.pool.keys()[int(rand_range(0, len(puppeteer.pool)))]
	puppeteer.rotate_npcs(new)
	