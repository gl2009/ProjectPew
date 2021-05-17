extends KinematicBody2D

var speed = 999

func _ready():
	pass

func _physics_process(delta):
	if Global.Player == null:
		return
	var pos_to_player = Global.Player.global_position - global_position
	pos_to_player = pos_to_player.normalized()
	move_and_collide(pos_to_player, speed)
	look_at(Global.Player.position)


func _on_Area2D_area_entered(area):
	if area.is_in_group("bullet"):
		queue_free()
