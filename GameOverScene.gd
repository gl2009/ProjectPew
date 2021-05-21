extends Node



func _on_title_pressed():
	get_tree().change_scene("res://Title.tscn")


func _on_retry_pressed():
	get_tree().change_scene("res://World.tscn")
