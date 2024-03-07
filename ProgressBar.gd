extends ProgressBar

@export var need_name : String
@onready var text : Label = get_node("Label")

func update_value (new_value, max):
	max_value = max_value
	value = new_value
	
	text.text = str(need_name, ": ", int(value), "/")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
