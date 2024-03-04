extends Node
class_name Shaker



@export var shaker : Node
@export var lerp_amount = 0.1
var Magnitude = 0.0
var ShakeTime = 0.0

signal shake_finished


func shake(magnitude:float, override = true):
	if override:
		Magnitude = magnitude
	else:
		Magnitude += magnitude 

func _process(delta):
	if Magnitude > 0.01:
		ShakeTime += delta
		var lb = 1 - pow(0.5, delta*60  *lerp_amount)
		Magnitude = lerp(Magnitude,0.0,lb)
		if shaker is Node2D or shaker is Control:
			shaker.position.x = cos(ShakeTime * 100) * Magnitude
			shaker.position.y = sin(ShakeTime* 75) * Magnitude
		elif shaker is Node3D:
			shaker.position.x = cos(ShakeTime * 100) * Magnitude
			shaker.position.y = sin(ShakeTime* 75) * Magnitude
			shaker.position.z = cos(ShakeTime* 75) * Magnitude
	else:
		if shaker is Node2D or shaker is Control:
			shaker.position = Vector2(0,0)
		elif shaker is Node3D:
			shaker.position = Vector3()
		emit_signal("shake_finished")
