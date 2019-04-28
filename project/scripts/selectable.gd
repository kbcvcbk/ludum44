extends Area2D

signal cursor_entered
signal cursor_exited
var selected = false

func _ready():
	connect("area_entered", self, "_on_cursor_entered")
	connect("area_exited", self, "_on_cursor_exited")

func _on_cursor_entered(cursor):
	if cursor.is_in_group("cursor"):
		selected = true

func _on_cursor_exited(cursor):
	if cursor.is_in_group("cursor"):
		selected = false
