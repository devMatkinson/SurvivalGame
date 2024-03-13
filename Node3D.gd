extends Node3D
var time : float
@export var day_length: float = 20.0
@export var start_time: float = 0.5
var time_rate : float

var Sun : DirectionalLight3D
@export var sun_color : Gradient
@export var sun_intensity : Curve

var moon : DirectionalLight3D
@export var moon_color : Gradient
@export var moon_intensity : Curve
@export var sky_horizon_color : Gradient
func _ready():
	time_rate = 1.0 / day_length
	time = start_time
	
	Sun = get_node("Sun")
	moon = get_node("Moon")


func _process(delta):
	time += time_rate * delta
	if time >= 1.0:
		time = 0.0
		
	Sun.rotation_degrees.x = time * 360 + 90
	Sun.light_color = sun_color.sample(time)
	Sun.light_energy = sun_intensity.sample(time)

	moon.rotation_degrees.x = time * 360 + 270
	moon.light_color = moon_color.sample(time)
	moon.light_energy = moon_intensity.sample(time)
	moon.visible = moon.light_energy > 0
