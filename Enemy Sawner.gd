extends Node2D

const Enemy = preload("res://Enemy.tscn")

onready var spawnPoint = $Spawnpoint

func spawn_enemy():
	pass

func _ready():
	var enemy = Enemy.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = global_position

func _on_Timer_timeout():
	spawn_enemy()
