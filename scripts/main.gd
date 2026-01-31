extends Node

var bag:Array
var hand:Array
var hand_size:int = 14
var okey_tile_scene: PackedScene = preload("res://scenes/okey_tile.tscn")

func fill_bag_with_starter_tiles():
	var starter_colors:Array = ["black", "red", "blue", "yellow"]
	for tile_color in starter_colors:
		for tile_number in range(1,14):
			var new_tile = okey_tile_scene.instantiate()
			new_tile.okey_tile_color = tile_color
			new_tile.okey_tile_number = tile_number
			bag.append(new_tile)
			add_child(new_tile)
	
func draw_starter_tiles_to_hand():
	for i in range(hand_size):
		var chosen_tile = bag.pick_random()
		hand.append(chosen_tile)
		bag.erase(chosen_tile)
	
func _ready() -> void:
	fill_bag_with_starter_tiles()
	print(bag.size())
	print("Bag: ",bag)
	draw_starter_tiles_to_hand()
	print(hand.size())
	print("Hand: ",hand)
	print(bag.size())
	print("Bag: ",bag)
