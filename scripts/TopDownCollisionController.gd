extends CharacterBody2D

# Script Documentation:
# This script provides a basic 2D top-down movement controller for a character.
# It allows for movement along the X and Y axes using user-defined or default input actions.
# Users can customize the input actions via the exported variables in the Godot editor.
# The script is designed to be attached to a CharacterBody2D node.

# Exported Variables:
# speed: The speed at which the character moves.
# input_right: The input action name for moving the character to the right.
# input_left: The input action name for moving the character to the left.
# input_down: The input action name for moving the character downwards.
# input_up: The input action name for moving the character upwards.

@export var speed : float = 200.0
@export var input_right : String = "ui_right"
@export var input_left : String = "ui_left"
@export var input_down : String = "ui_down"
@export var input_up : String = "ui_up"

func _physics_process(delta):
	# This function is called every physics frame and handles character movement.
	# It checks for pressed input actions and updates the character's velocity accordingly.
	# The character's movement is then executed using the move_and_collide() method,
	# which also handles basic collision detection and response.
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed(input_right):
		velocity.x += 1
	if Input.is_action_pressed(input_left):
		velocity.x -= 1
	if Input.is_action_pressed(input_down):
		velocity.y += 1
	if Input.is_action_pressed(input_up):
		velocity.y -= 1
	
	velocity = velocity.normalized() * speed
	move_and_collide(velocity * delta)
