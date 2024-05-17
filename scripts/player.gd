extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

const Animations = {
	RUN = "run",
	IDLE = "idle",
	JUMP = "jump"
}

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		audio_stream_player_2d.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement /deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play(Animations.RUN)
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play(Animations.RUN)
	else:
		animated_sprite_2d.play(Animations.IDLE)
		
	if velocity.y < 0:
		animated_sprite_2d.play(Animations.JUMP)
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
