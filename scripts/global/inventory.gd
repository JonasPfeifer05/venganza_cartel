extends Node

signal inventory_content_changed(inventory: Dictionary[Item, int])
signal inventory_visibility_changed(visible: bool)

var inventory: Dictionary[Item, int] = {}
const inventory_size: int = 9
var visible: bool = false

func add_item(item_data: ItemComponent):
	print("Add item")
	var amount = item_data.amount;
	var item = item_data.item;
	
	if inventory.size() == inventory_size && !inventory.has(item):
		return
	
	if amount <= 0:
		return
	
	var previous_amount = inventory.get_or_add(item, 0)
	inventory.set(item, previous_amount + amount)
	inventory_content_changed.emit(inventory)

func remove_item(item_data: ItemComponent):
	var amount = item_data.amount;
	var item = item_data.item;
		
	if amount <= 0:
		return
	
	var previous_amount = inventory.get_or_add(item, 0)
	if amount == previous_amount:
		inventory.erase(item)
	elif amount < previous_amount:
		inventory.set(item, previous_amount - amount)
	
	inventory_content_changed.emit(inventory)

func set_visible(new_visible: bool):
	visible = new_visible
	inventory_visibility_changed.emit(visible)
	
