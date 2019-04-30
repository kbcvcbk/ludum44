extends Node

var npc_database_file = "res://assets/writing/npc_database.csv"
var item_matchup_file = "res://assets/writing/npc_item_matchup.csv"

func list_items():
	var file = File.new()
	file.open(item_matchup_file, File.READ)
	var array = Array(file.get_csv_line())
	array.pop_front()
	for i in range(len(array)):
		array[i] = array[i].to_lower()
	return array

func read_npc_db():
	#npc_db
	var npc_db = {}
	var file = File.new()
	var header = []
	var read_header = false
	file.open(npc_database_file, File.READ)
	while !file.eof_reached():
		if !read_header:
			header = file.get_csv_line()
			read_header = true
		else:
			var line = file.get_csv_line()
			var npc_name = line[0]
			npc_db[npc_name] = {}
			npc_db["generico"] = {}
			for i in range(len(line)):
				if header[i] == "entered_quote":
					npc_db[npc_name][header[i]] = line[i].split("|")
	file.close()
	#item
	file = File.new()
	file.open(item_matchup_file, File.READ)
	header = []
	read_header = false
	while !file.eof_reached():
		if !read_header:
			header = file.get_csv_line()
			read_header = true
		else:
			var line = file.get_csv_line()
			var npc_name = line[0].to_lower()
			for item in range(len(header)):
				if header[item] != "" and line[item] != "":
						npc_db[npc_name][header[item].to_lower()] = line[item].split("|")
	file.close()
	return npc_db
