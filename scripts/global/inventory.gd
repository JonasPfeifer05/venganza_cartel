extends Node

signal inventory_changed(inventory: Dictionary[ItemType.Variant, int])

var inventory: Dictionary[ItemType.Variant, int] = {}
const inventory_size: int = 10

func add_item(item_data: ItemData):
	if inventory.size() == inventory_size && !inventory.has(item_data.type):
		return
	
	if item_data.amount <= 0:
		return
	
	var previous_amount = inventory.get_or_add(item_data.type, 0)
	inventory.set(item_data.type, previous_amount + item_data.amount)
	inventory_changed.emit(inventory)

func remove_item(item_data: ItemData):
	if item_data.amount <= 0:
		return
	
	var previous_amount = inventory.get_or_add(item_data.type, 0)
	if item_data.amount == previous_amount:
		inventory.erase(item_data.type)
	elif item_data.amount < previous_amount:
		inventory.set(item_data.type, previous_amount - item_data.amount)
	
	inventory_changed.emit(inventory)

