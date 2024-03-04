@tool
extends Resource
class_name Dialogue



@export var lines : Array[DialogueLine]
@export var line_connections : Array[DialogueConnections]
func get_line(index) -> DialogueLine:
	return(lines[index])
func get_next_line(index, choice) -> int:
	if index < line_connections.size():
		return line_connections[index].get_connection(choice)
	return 0
