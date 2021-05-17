extends KinematicBody2D
class_name Player

export var speed = 200
export var bullet_speed = 1000
export var fire_rate = 0.2

var Bullet = preload("res://Bullet.tscn")
var can_fire = true

func _process(delta):
	if Input.is_action_just_pressed("LMB") and can_fire:
		var bullet_instance = Bullet.instance()
		bullet_instance.position = $BulletPoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true
	look_at(get_global_mouse_position())

func _physics_process(delta):
	var direction = Vector2()
	if Input.is_action_pressed("ui_right"):
		direction += Vector2(1, 0)
	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-1, 0)
	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		direction += Vector2(0, 1)
	move_and_slide(direction * speed)

func _ready():
	Global.Player = self





func _on_Area2D_area_entered(area):
	if !area.is_in_group("bullet"):
		queue_free()
		get_tree().change_scene("res://GameOverScene.tscn")
