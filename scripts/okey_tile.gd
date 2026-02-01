extends ColorRect
class_name OkeyTile

var okey_tile_color:String
var okey_tile_number:int

func _to_string() -> String:
	return "[%s - %d]" % [okey_tile_color, okey_tile_number]

func _init(chosen_tile_color = "black", chosen_tile_number = 1) -> void:
	okey_tile_color = chosen_tile_color
	okey_tile_number = chosen_tile_number
	custom_minimum_size = Vector2(50,70)

func _ready():
	$Label.text = str(okey_tile_number)
	if okey_tile_color == "black":
		$Label.add_theme_color_override("font_color",Color(0.2, 0.2, 0.2, 1.0))
	elif okey_tile_color == "blue":
		$Label.add_theme_color_override("font_color",Color(0.1, 0.4, 1.0, 1))
	elif okey_tile_color == "green":
		$Label.add_theme_color_override("font_color",Color(0.4, 1.0, 0.4, 1.0))
	elif okey_tile_color == "red":
		$Label.add_theme_color_override("font_color",Color(1.0, 0.4, 0.3, 1.0))
	$Label.add_theme_constant_override("outline_size", 2)
	$Label.add_theme_color_override("font_outline_color", Color(0.0, 0.0, 0.0, 1.0))

func _get_drag_data(_at_position):
	
	var preview = self.duplicate()
	
	preview.okey_tile_color = okey_tile_color
	preview.okey_tile_number = okey_tile_number
	
	#preview.modulate.a = 0.8 
	#preview.rotation_degrees = 5
	
	var c = Control.new()
	c.add_child(preview)
	preview.position = -0.5 * size
	set_drag_preview(c)
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	self.visible = false
	
	return self

func _notification(what):
	if what == NOTIFICATION_DRAG_END:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if not is_drag_successful():
			self.visible = true
