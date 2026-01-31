extends ColorRect
class_name OkeyTile

var okey_tile_color:String
var okey_tile_number:int


func _to_string() -> String:
	return "[%s - %d]" % [okey_tile_color, okey_tile_number]

func _init(chosen_tile_color = "BLACK", chosen_tile_number = 1) -> void:
	okey_tile_color = chosen_tile_color
	okey_tile_number = chosen_tile_number
	
