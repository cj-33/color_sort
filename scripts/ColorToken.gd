# Represents a draggable, sortable colored item
class_name ColorToken
extends ColorRect

# Set initial visual and interaction properties
func _ready() -> void:
    custom_minimum_size = Vector2(80, 80)
    mouse_filter = Control.MOUSE_FILTER_PASS
