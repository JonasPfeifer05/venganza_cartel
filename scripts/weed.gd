extends Node2D
class_name Weed

@export var gridPostionComponent: GridPositionComponent

@export var grid_position: Vector2i:
	set(value):
		gridPostionComponent.grid_position = value
		gridPostionComponent.updateLocation()
