extends Area2D

@onready var game_state = %GameState
@onready var animation_player = $AnimationPlayer

func _on_body_entered(_body):
	game_state.add_point()
	animation_player.play("pickup")

