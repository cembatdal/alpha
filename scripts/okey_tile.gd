extends ColorRect
class_name OkeyTile

var okey_tile_color:String
var okey_tile_number:int

func _to_string() -> String:
	return "[%s - %d]" % [okey_tile_color, okey_tile_number]

func _init(chosen_tile_color = "black", chosen_tile_number = 1) -> void:
	okey_tile_color = chosen_tile_color
	okey_tile_number = chosen_tile_number

func _ready():
	$Label.text = str(okey_tile_number)
	if okey_tile_color == "black":
		$Label.font_color = Color(0.2, 0.2, 0.2, 1.0)
	elif okey_tile_color == "blue":
		$Label.font_color = Color(0.1, 0.4, 1.0, 1)
	elif okey_tile_color == "yellow":
		$Label.font_color = Color(1.0, 0.9, 0.4, 1.0)
	elif okey_tile_color == "red":
		$Label.font_color = Color(1.0, 0.4, 0.3, 1.0)
