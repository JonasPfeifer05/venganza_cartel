extends Node2D
class_name Weed

@onready var gridPositionComponent: GridPositionComponent = $GridPositionComponent
@export var sprite: AnimatedSprite2D

@export var is_grown: bool = false:
	set(value):
		is_grown = value
		if sprite:
			if value:
				sprite.play("100_percent")
			else:
				sprite.play("0_percent")
		
@export var grid_position: Vector2i:
	set(value):
		grid_position = value
		if gridPositionComponent:
			gridPositionComponent.grid_position = value
			gridPositionComponent.updateLocation()

func _ready() -> void:
	gridPositionComponent.grid_position = grid_position
	gridPositionComponent.updateLocation()
	
	if sprite:
		if is_grown:
			sprite.play("100_percent")
		else:
			sprite.play("0_percent")
