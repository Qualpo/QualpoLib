extends Resource
class_name DialogueCharacter


@export var name : String : 
	get:
		return name
		
@export var icons : Array[Texture]
@export var text_sound : AudioStream
@export var text_sound_override : Dictionary = {
	" ":null,
	"\n":null
}

func get_icon(index : int) -> Texture:
	if index < icons.size():
		return icons[index]
	return null

func get_text_sound(c:String) -> AudioStream:
	if text_sound_override.has(c):
		var aud = text_sound_override[c]
		if aud is AudioStream or aud == null:
			return aud
	return text_sound
