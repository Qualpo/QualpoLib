extends Resource
class_name DialogueLine


@export_multiline var text : String
@export var icon : int
@export var speed_multiplier : float = 1.0
@export var character : DialogueCharacter



func get_character() -> DialogueCharacter:
	return character
func get_text() -> String:
	return text
func get_icon() -> Texture:
	if character != null:
		return character.get_icon(icon)
	return null
func get_name() -> String:
	if character != null:
		print("WFAHFOIUHAEOIFGH")
		return character.name
	return ""
func get_text_sound(c : String) -> AudioStream:
	if character != null:
		return character.get_text_sound(c)
	return null
