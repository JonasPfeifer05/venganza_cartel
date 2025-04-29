extends Node

@onready var weedScene: PackedScene = preload("../scenes/weed.tscn")
@onready var gridPositionComponent: PackedScene = preload("../scenes/gridPositionComponent.tscn")

@export var weedParentNode: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	for i in 6:
		var weed = weedScene.instantiate()
		var gridPosition: GridPositionComponent = gridPositionComponent.instantiate()
		gridPosition.random_offset = 0.2
		gridPosition.grid_position = Vector2i(-3+i,-3)
		gridPosition.moveable = weed
		weed.add_child(gridPosition)
		
		weedParentNode.call_deferred("add_child", weed)
		
	for i in 6:
		var weed = weedScene.instantiate()
		var gridPosition: GridPositionComponent = gridPositionComponent.instantiate()
		gridPosition.random_offset = 0.2
		gridPosition.grid_position = Vector2i(-3+i,2)
		gridPosition.moveable = weed
		weed.add_child(gridPosition)	
		
		weedParentNode.call_deferred("add_child", weed)
