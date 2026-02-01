extends Node

var bag:Array
var hand:Array
var hand_size:int = 14
var okey_tile_scene: PackedScene = preload("res://scenes/okey_tile.tscn")
var viewport = DisplayServer.window_get_size()

@onready var game_board = $CanvasLayer/OkeyBoard

func fill_bag_with_starter_tiles():
	var starter_colors:Array = ["black", "red", "blue", "green"]
	for tile_color in starter_colors:
		for tile_number in range(1,14):
			var new_tile = okey_tile_scene.instantiate()
			new_tile.okey_tile_color = tile_color
			new_tile.okey_tile_number = tile_number
			bag.append(new_tile)
			#new_tile.position.x = randf_range(1, viewport.x)
			#new_tile.position.y = randf_range(1, viewport.y)
			#add_child(new_tile)

func draw_starter_tiles_to_hand():
	bag.shuffle()
	
	# Board'a soruyoruz: "Hey, elindeki slotları bana ver"
	var tum_slotlar = game_board.get_all_slots()
	
	for i in range(hand_size):
		if i >= tum_slotlar.size():
			break
			
		var chosen_tile = bag.pop_back()
		hand.append(chosen_tile)
		
		var hedef_slot = tum_slotlar[i]
		hedef_slot.add_child(chosen_tile)
		chosen_tile.position = Vector2.ZERO
func _ready() -> void:
	fill_bag_with_starter_tiles()
	print(bag.size())
	print("Bag: ",bag)
	draw_starter_tiles_to_hand()
	print(hand.size())
	print("Hand: ",hand)
	print(bag.size())
	print("Bag: ",bag)
