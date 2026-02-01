extends Control
class_name OkeySlot

# --- CAN DROP DATA (Kabul Ediyor Muyum?) ---
# Bu fonksiyon, mouse ile bir şey slotun üzerine geldiğinde
# Godot tarafından saniyede defalarca çağrılır.
func _can_drop_data(_at_position, data):

	if not (data is OkeyTile):
		return false

	for child in get_children():
		if child is OkeyTile:
			return false

	return true


# --- DROP DATA (Kabul Ettim, İçeri Al) ---
# Mouse bırakıldığı an çalışır.
func _drop_data(_at_position, tas):
	
	tas.get_parent().remove_child(tas)
	add_child(tas)
	tas.visible = true
	tas.position = Vector2.ZERO
