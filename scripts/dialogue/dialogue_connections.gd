extends Resource
class_name DialogueConnections

@export var connection_list : Array[int] = [0]

func get_connection(index : int) -> int:
	if index < connection_list.size():
		return connection_list[index]
	return 0
