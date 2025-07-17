extends RigidBody3D

@onready var omni_light_3d = $OmniLight3D
@onready var mesh_instance_3d = $MeshInstance3D

var color;
var colors = [
	Color(0.984, 0.796, 0.894), # pastel pink
	Color(0.702, 0.894, 0.941), # baby blue
	Color(0.800, 0.922, 0.800), # mint green
	Color(1.000, 0.925, 0.753), # soft yellow
	Color(0.929, 0.769, 0.886), # lavender
	Color(0.925, 0.788, 0.694), # peach
]

func _ready():
	rand_color()

func _process(delta):
	pass

func rand_color():
	color = colors[randi() % colors.size()]
	omni_light_3d.light_color = color;
	
	var mat = StandardMaterial3D.new()
	mat.albedo_color = color
	mat.emission_enabled = true
	mat.emission = color
	mesh_instance_3d.material_override = mat
	
func _on_timer_timeout():
	rand_color()
	
