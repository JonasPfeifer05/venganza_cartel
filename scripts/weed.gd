extends Node2D
class_name Weed

@onready var gridPositionComponent: GridPositionComponent = $GridPositionComponent

@export var grid_position: Vector2i:
	set(value):
		grid_position = value
		if gridPositionComponent:
			gridPositionComponent.grid_position = value
			gridPositionComponent.updateLocation()

func _ready() -> void:
	gridPositionComponent.grid_position = grid_position
	gridPositionComponent.updateLocation()
