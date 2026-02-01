extends Control
class_name Board

@onready var top_floor = $BoardStructure/TopFloor
@onready var bottom_floor = $BoardStructure/BottomFloor

# Board, kendi üzerindeki boş slotları bulup listeler
func get_all_slots() -> Array:
	var slots = []
	slots.append_array(top_floor.get_children())
	slots.append_array(bottom_floor.get_children())
	return slots
