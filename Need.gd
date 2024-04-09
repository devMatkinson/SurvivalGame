extends Node
class_name Need

var value : float
@export var max_value : float
@export var start_value : float
@export var regen_rate : float
@export var decay_rate : float
@export var ui_bar : Node

func add(amount):
	value += amount
	if value > max_value:
		value = max_value
		
func subtract(amount):
	value -= amount
	if value < 0:
		value = 0

func update_ui_bar():
	ui_bar.update_value(value, max_value)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
