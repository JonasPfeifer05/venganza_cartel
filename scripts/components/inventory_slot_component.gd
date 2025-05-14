extends Control
class_name InventorySlotComponent

@onready var label: Label = $Label
@onready var texture_rect: TextureRect = $TextureRect
@export var item: Item:
	set(value):
		item = value
		if texture_rect:
			assign_texture()
		else:
			call_deferred("assign_texture")
			
@export var amount: int = 0:
	set(value):
		amount = value
		if label:
			assign_amount()
		else:
			call_deferred("assign_amount")

func _ready() -> void:
	print("label: " + str(label))
	print("texture: " + str(texture_rect))

func assign_texture():
	texture_rect.texture = item.texture

func assign_amount():
	print(label)
	label.text = str(amount)
