# Container that accepts colored tokens dropped over it, stacked bottom-up
class_name Tube
extends Control

@export var max_capacity: int = 4
@onready var slots: VBoxContainer = $Slots

var items: Array[Color] = []

static var all: Array[Tube] = []

func _ready() -> void:
    all.append(self)

func _exit_tree() -> void:
    all.erase(self)

func push_item(color: Color) -> bool:
    if items.size() >= max_capacity:
        return false
    items.append(color)
    return true

func pop_item() -> Color:
    return items.pop_back() if items.size() > 0 else Color.TRANSPARENT

# Global position of the slot for a given 0-based stack height (0 = bottom)
func get_slot_position(stack_index: int) -> Vector2:
    var slot_index := max_capacity - 1 - stack_index
    return slots.get_child(slot_index).global_position
