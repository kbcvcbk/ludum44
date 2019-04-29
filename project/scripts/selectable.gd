extends Area2D

signal cursor_entered
signal cursor_exited
var selected : bool

func _ready():
	self.add_to_group("selectable")
	connect("area_entered", self, "_on_cursor_entered")
	connect("area_exited", self, "_on_cursor_exited")

func _on_cursor_entered(area):
	if area.is_in_group("cursor"):
		cursor.select(self)
		if get("held") != null and cursor.item != null: cursor.item.connect("dropped", self, "_on_item_dropped")

func _on_cursor_exited(area):
	if area.is_in_group("cursor"):
		cursor.unselect(self)
		if get("held") != null and cursor.item != null: cursor.item.disconnect("dropped", self, "_on_item_dropped")
