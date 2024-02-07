extends Node
class_name Shake



@export var Shaker : Node
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
		if Shaker is Node2D or Shaker is Control:
			Shaker.position.x = cos(ShakeTime * 100) * Magnitude
			Shaker.position.y = sin(ShakeTime* 75) * Magnitude
		elif Shaker is Node3D:
			Shaker.position.x = cos(ShakeTime * 100) * Magnitude
			Shaker.position.y = sin(ShakeTime* 75) * Magnitude
			Shaker.position.z = cos(ShakeTime* 75) * Magnitude
	else:
		if Shaker is Node2D or Shaker is Control:
			Shaker.position = Vector2(0,0)
		elif Shaker is Node3D:
			Shaker.position = Vector3()
		emit_signal("shake_finished")
