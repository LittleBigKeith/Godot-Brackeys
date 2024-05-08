extends Area2D

@onready var timer = $Timer
var killzone_body = null

func _on_body_entered(body):
	Engine.time_scale = 0.8
	print("You died!")
	body.allow_input = false
	body.velocity.y = body.JUMP_VELOCITY / 2
	body.get_node("CollisionShape2D").queue_free()
	killzone_body = body
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	killzone_body.allow_input = true
	get_tree().reload_current_scene()
