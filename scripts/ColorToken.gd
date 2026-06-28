# Represents a draggable, sortable colored item
class_name ColorToken
extends ColorRect

var _dragging := false
var _grab_offset := Vector2.ZERO

# Set initial visual and interaction properties
func _ready() -> void:
    custom_minimum_size = Vector2(80, 80)
    mouse_filter = Control.MOUSE_FILTER_PASS

# Begin drag on press, release on unpress
func _gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        _dragging = event.pressed
        _grab_offset = get_global_mouse_position() - global_position

# Follow cursor while dragging
func _process(_delta: float) -> void:
    if _dragging:
        global_position = get_global_mouse_position() - _grab_offset
