extends Node
class_name Shaker



@export var shaker : Node
var Magnitude = 0.0
var ShakeTime = 0.0

signal shake_finished


func shake(magnitude:float, override = true):
	if override:
		Magnitude = magnitude
	else:
		Magnitude += magnitude 

func _physics_process(delta):
	if Magnitude > 0.01:
		ShakeTime += delta
		Magnitude = lerp(Magnitude,0.0,0.1)
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
