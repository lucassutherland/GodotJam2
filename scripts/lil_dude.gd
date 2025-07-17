extends CharacterBody3D

@onready var camera = $CameraArm
@onready var raycast = $RayCast3D

const SPEED = 10.0
const JUMP_VELOCITY = 8.0
const MOUSE_SENSITIVITY = 0.005
var yoinked_mouse = true;

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	#camera.current = true

func _unhandled_input(event):
	if event is InputEventMouseMotion and yoinked_mouse:
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		camera.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, -PI / 2, PI / 2)
		
	if Input.is_action_just_pressed("quit"):
		if (yoinked_mouse):
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		yoinked_mouse = !yoinked_mouse

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= 9.8 * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
