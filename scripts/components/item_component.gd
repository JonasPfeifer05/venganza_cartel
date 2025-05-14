extends Area2D
class_name ItemComponent

@export var on_pickup_destroy_node: Node
@export var item: Item
@export var amount: int


func _on_area_entered(_collector: CollectorComponent) -> void:
	if on_pickup_destroy_node:
		on_pickup_destroy_node.queue_free()
