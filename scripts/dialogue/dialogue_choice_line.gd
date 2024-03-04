@tool
extends DialogueLine
class_name DialogueChoiceLine


@export var choices : Array[String]

func get_choice_amount() -> int:
	return choices.size()
func get_choice(index:int) -> String:
	if index < choices.size():
		return choices[index]
	return ""
