extends Control

@onready var inventorySlotScene: PackedScene = preload("res://scenes/components/inventory_slot_component.tscn")

var slots: Array[InventorySlotComponent] = []
const center_offset = Vector2(-9.25,-9.25)
const slot_offset = Vector2(24.75, 24.75)

func _ready() -> void:
	update_visibility()
	Inventory.inventory_content_changed.connect(rerender_inventory)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("inventory"):
		Inventory.set_visible(!Inventory.visible)
		update_visibility()

func update_visibility():
	visible = Inventory.visible
	
func rerender_inventory(inventory: Dictionary[Item, int]):
	print("Inventory changed: " + str(inventory))
	
	for slot in slots:
		slot.queue_free()
	
	var new_slots: Array[InventorySlotComponent] = []
	var i = 0;
	for item in inventory.keys():
		var x = i%3;
		var y = i/3;
		
		var slot_position = center_offset + slot_offset * Vector2(x - 1, y - 1)
		
		var slot = inventorySlotScene.instantiate();
		slot.position = slot_position;
		slot.amount = inventory.get(item)
		slot.item = item
		add_child(slot)
		
		
		new_slots.append(slot)
		i+=1;
	
	slots = new_slots
