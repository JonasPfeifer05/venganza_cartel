extends Area2D

@export var collectableComponent: CollectableComponent

func _ready() -> void:
	collectableComponent.entered_collectable.connect(_on_entered_collectable)

func _on_entered_collectable(collectable:CollectableComponent) -> void:
	if collectable.player:
		queue_free()
