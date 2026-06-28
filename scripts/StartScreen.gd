extends Node2D

func _ready() -> void:
	pass

func _on_start_button_pressed() -> void:
	# Change to the game scene when it exists
	# get_tree().change_scene_to_file("res://game.tscn")
	print("Start button pressed! (Game scene not created yet)")
