extends Node2D
class_name Weed

@onready var weedSprite = preload("res://sprites/weed/weed.png")
@onready var weedGrownSprite = preload("res://sprites/weed/weed_grown.png")

@onready var gridPositionComponent: GridPositionComponent = $GridPositionComponent
@export var sprite: Sprite2D

@export var is_grown: bool = false:
	set(value):
		is_grown = value
		if sprite:
			if value:
				sprite.texture = weedGrownSprite
			else:
				sprite.texture = weedSprite
		
@export var grid_position: Vector2i:
	set(value):
		grid_position = value
		if gridPositionComponent:
			gridPositionComponent.grid_position = value
			gridPositionComponent.updateLocation()

func _ready() -> void:
	gridPositionComponent.grid_position = grid_position
	gridPositionComponent.updateLocation()
	
	if is_grown:
		sprite.texture = weedGrownSprite
	else:
		sprite.texture = weedSprite
