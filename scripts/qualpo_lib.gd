extends Script
class_name QualpoLib

static func delta_lerp(a,b,t,d):
	var lt = 1 - pow(0.5, d*60 * t)
	return lerp(a,b,lt)
static  func delta_lerp_angle(a,b,t,d):
	var lt = 1 - pow(0.5, d*60 * t)
	return lerp_angle(a,b,lt)
