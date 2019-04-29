extends Node

var npc_database_file = "res://assets/writing/npc_db.csv"
var item_matchup_file = "res://assets/writing/item_matchup.csv"
var npc_db = {}
var header = []
var read_header = false

#func read_item_matchup():
#	var file = File.new()
#	file.open(item_matchup_file, File.READ)
#	while !file.eof_reached():
#		if 

func read_npc_db():
	var file = File.new()
	file.open(npc_database_file, File.READ)
	while !file.eof_reached():
		if !read_header:
			header = file.get_csv_line()
			read_header = true
		else:
			var line = file.get_csv_line()
			var npc_name = line[0]
			npc_db[npc_name] = {}
			for i in range(len(line)):
				if header[i] == "entered_quote":
					npc_db[npc_name][header[i]] = line[i].split("|")
	return npc_db
