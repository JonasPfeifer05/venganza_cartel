extends Control

func _ready() -> void:
	update_visibility()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("inventory"):
		Inventory.set_visible(!Inventory.visible)
		update_visibility()

func update_visibility():
	visible = Inventory.visible
