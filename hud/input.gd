extends Control

# TODO change button sprites to controller layout and symbols

var device_id = 0

# radius of sticks to prevent go bumbum
var stick_radius: float = 7

func _process(_delta):
	if Input.get_connected_joypads().is_empty():
		return
		
	# bayx
	$Button0.frame = 1 if Input.is_joy_button_pressed(device_id, JOY_BUTTON_A) else 0 
	$Button1.frame = 1 if Input.is_joy_button_pressed(device_id, JOY_BUTTON_B) else 0 
	$Button2.frame = 1 if Input.is_joy_button_pressed(device_id, JOY_BUTTON_X) else 0 
	$Button3.frame = 1 if Input.is_joy_button_pressed(device_id, JOY_BUTTON_Y) else 0 
	
	# l1 r1
	$Button4.frame = 1 if Input.is_joy_button_pressed(device_id, JOY_BUTTON_LEFT_SHOULDER) else 0
	$Button5.frame = 1 if Input.is_joy_button_pressed(device_id, JOY_BUTTON_RIGHT_SHOULDER) else 0
	
	# select start
	$Button6.frame = 1 if Input.is_joy_button_pressed(device_id, JOY_BUTTON_BACK) else 0
	$Button7.frame = 1 if Input.is_joy_button_pressed(device_id, JOY_BUTTON_START) else 0
	
	# l2 r2
	if has_node("Button8"):
		var l2_pressed = Input.get_joy_axis(device_id, JOY_AXIS_TRIGGER_LEFT) 
		$Button8.frame = 1 if l2_pressed else 0
		
	if has_node("Button9"):
		var r2_pressed = Input.get_joy_axis(device_id, JOY_AXIS_TRIGGER_RIGHT) 
		$Button9.frame = 1 if r2_pressed else 0

	# dpad
	$DPAD/up.visible = Input.is_joy_button_pressed(device_id, JOY_BUTTON_DPAD_UP)
	$DPAD/down.visible = Input.is_joy_button_pressed(device_id, JOY_BUTTON_DPAD_DOWN)
	$DPAD/left.visible = Input.is_joy_button_pressed(device_id, JOY_BUTTON_DPAD_LEFT)
	$DPAD/right.visible = Input.is_joy_button_pressed(device_id, JOY_BUTTON_DPAD_RIGHT)

	# l3 r3
	$Lstick.frame = 1 if Input.is_joy_button_pressed(device_id, JOY_BUTTON_LEFT_STICK) else 0
	$Rstick.frame = 1 if Input.is_joy_button_pressed(device_id, JOY_BUTTON_RIGHT_STICK) else 0

	# analog stick things
	
	# left
	var left_stick_dir = Vector2(
		Input.get_joy_axis(device_id, JOY_AXIS_LEFT_X),
		Input.get_joy_axis(device_id, JOY_AXIS_LEFT_Y)
	)
	
	$Lstick/stick.position = left_stick_dir * stick_radius

	# right
	var right_stick_dir = Vector2(
		Input.get_joy_axis(device_id, JOY_AXIS_RIGHT_X),
		Input.get_joy_axis(device_id, JOY_AXIS_RIGHT_Y)
	)
	$Rstick/stick.position = right_stick_dir * stick_radius
