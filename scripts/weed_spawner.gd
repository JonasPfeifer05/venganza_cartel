extends Node

@onready var weedScene: PackedScene = preload("../scenes/weed.tscn")

@export var weedParentNode: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	for i in 6:
		var weed: Weed = weedScene.instantiate()
		weed.grid_position =  Vector2i(-3+i,-3)
		
		weedParentNode.add_child.call_deferred(weed)
		
	for i in 6:
		var weed = weedScene.instantiate()
		weed.grid_position = Vector2i(-3+i,2)
		
		weedParentNode.add_child.call_deferred(weed)
