# Main controller for the game scene
class_name GameManager
extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass

# Handle system events like the Android back button
func _notification(what: int) -> void:
    if what == NOTIFICATION_WM_GO_BACK_REQUEST:
        get_tree().change_scene_to_file("res://start.tscn")
