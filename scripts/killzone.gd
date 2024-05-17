extends Area2D

@onready var timer = $Timer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

func _on_body_entered(body):
	audio_stream_player_2d.play()
	body.get_node("CollisionShape2D").queue_free()
	body.get_node("AnimatedSprite2D").flip_v = true

	Engine.time_scale = 0.5 
	timer.start()
 
  
func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
