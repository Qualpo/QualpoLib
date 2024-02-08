extends Resource
class_name Registry

@export var entries : Dictionary = {}


func AddEntry(key,value) -> void:
	entries[key] = value
func GetValue(key):
	if entries.has(key):
		return entries[key]
	else:
		print("no value with key " + key)
		return null
func GetAllValues() -> Array:
	return entries.values()
func GetAllKeys() -> Array:
	return entries.keys()
func GetLength() -> int:
	return entries.size()
func RemoveEntry(key) -> void:
	if entries.has(key):
		entries.erase(key)
	else:
		print("no value with key " + key)
