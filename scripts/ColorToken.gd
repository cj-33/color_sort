# Represents a draggable, sortable colored item
class_name ColorToken
extends ColorRect

var _dragging := false
var _grab_offset := Vector2.ZERO
var _drag_start_position := Vector2.ZERO

# Set initial visual and interaction properties
func _ready() -> void:
    mouse_filter = Control.MOUSE_FILTER_PASS

# Begin drag on press, drop into a tube (or revert) on release
func _gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        _dragging = event.pressed
        if _dragging:
            _grab_offset = get_global_mouse_position() - global_position
            _drag_start_position = global_position
            move_to_front()
        else:
            _drop()

# Follow cursor while dragging
func _process(_delta: float) -> void:
    if _dragging:
        global_position = get_global_mouse_position() - _grab_offset

# Snap into the tube under the cursor, or revert if none accepts the color
func _drop() -> void:
    for tube in Tube.all:
        if tube.get_global_rect().has_point(get_global_mouse_position()):
            if tube.push_item(color):
                global_position = tube.get_slot_position(tube.items.size() - 1)
                return
            break
    global_position = _drag_start_position
