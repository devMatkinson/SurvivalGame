extends MeshInstance3D
@onready var apple = preload("res://apple.tscn")
@onready var apple_spawn_point = $StaticBody3D/AppleSpawnPoint

var spawn_index = 0
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var number =floor(rng.randf_range(2,0))
	if number ==0:
		$StaticBody3D/Timer.paused = true
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if apple_spawn_point.get_child(spawn_index).get_child_count()== 0:
		var object_instance = apple.instantiate()
		apple_spawn_point.get_child(spawn_index).add_child(object_instance)
		spawn_index += 1
	if spawn_index > 2:
		spawn_index = 0
	
