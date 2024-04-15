extends Node
class_name Shaker



@export var shaker : Node
@export var lerp_amount = 0.1
@export var frequency = Vector2(100,75)
var Magnitude = 0.0
var ShakeTime = 0.0

signal shake_finished


func shake(magnitude:float, override = true):
	if override:
		Magnitude = magnitude
	else:
		Magnitude += magnitude 

func _process(delta):
	shaking(delta)
func shaking(delta):
	if Magnitude > 0.01:
		ShakeTime += delta
		var lb = 1 - pow(0.5, delta*60  *lerp_amount)
		Magnitude = lerp(Magnitude,0.0,lb)
		if shaker is Node2D or shaker is Control:
			shaker.position = shake2d()
		elif shaker is Node3D:
			shaker.position = shake3d()
	else:
		if shaker is Node2D or shaker is Control:
			shaker.position = Vector2(0,0)
		elif shaker is Node3D:
			shaker.position = Vector3()
		emit_signal("shake_finished")
func shake2d()-> Vector2:
	var vec = Vector2()
	vec.x = cos(ShakeTime * frequency.x) * Magnitude
	vec.y = sin(ShakeTime* frequency.y) * Magnitude
	return vec
func shake3d()->Vector3:
	var vec = Vector3()
	vec.x = cos(ShakeTime * 100) * Magnitude
	vec.y = sin(ShakeTime* 75) * Magnitude
	vec.z = cos(ShakeTime* 75) * Magnitude
	return vec
