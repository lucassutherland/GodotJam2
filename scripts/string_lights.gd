extends Node3D

@onready var point_a = $PointA
@onready var point_b = $PointB

@export var sag = -5
@export var interval = 2
const SINGLE_STRING_LIGHT = preload("res://scenes/single_string_light.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	# bezier curve bc im a pro
	var bez = Curve3D.new()
	
	
	var sag = Vector3(0, sag, 0) 
	
	bez.add_point(point_a.position, Vector3.ZERO, sag)
	bez.add_point(point_b.position, sag, Vector3.ZERO)
	
	bez.bake_interval = interval
	
	
	for point in bez.get_baked_points():
		var light = SINGLE_STRING_LIGHT.instantiate()
		light.position = point
		add_child(light)
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
