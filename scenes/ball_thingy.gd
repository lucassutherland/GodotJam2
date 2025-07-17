extends RigidBody3D

@onready var omni_light_3d = $OmniLight3D

var color;
colors = [Color(1.0, 0.0, 0.0, 1.0),
		  Color(0.0, 1.0, 0.0, 1.0),
		  Color(0.0, 0.0, 1.0, 0.0)]
		
func _ready():
	pass # Replace with function body.
	timer = new Timer()

func _process(delta):
	pass


func _on_timer_timeout():
	color = colors[randi() % colors.size()]
	omni_light_3d.light_color = 
