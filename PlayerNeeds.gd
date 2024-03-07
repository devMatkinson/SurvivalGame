extends Node3D
var health : Need
var hunger : Need
var thirst : Need
@export var no_hunger_health_decay : float
@export var no_thirst_health_decay : float


# Called when the node enters the scene tree for the first time.
func _ready():
	health = get_node("Health")
	hunger = get_node("Hunger")
	thirst = get_node("Thirst")
	
	health.value = health.start_value
	hunger.value = hunger.start_value
	thirst.value = thirst.start_value
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hunger.subtract(no_hunger_health_decay * delta)
	thirst.subtract(no_thirst_health_decay * delta)
	
	if hunger.value == 0:
		health.subtract(no_hunger_health_decay * delta)
	if thirst.value == 0:
		health.subtract(no_thirst_health_decay * delta)
		
	if health.value == 0:
		print('dead')
		
	health.update_ui_bar()
	hunger.update_ui_bar()
	thirst.update_ui_bar()
