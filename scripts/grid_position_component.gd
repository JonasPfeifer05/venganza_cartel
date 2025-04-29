extends Node
class_name GridPositionComponent

@export var moveable: Node2D
@export var random_offset: float = 0
@export var grid_size: int = 16;

var grid_position: Vector2i

func updateLocation(): 
	var world_position: Vector2 = (Vector2(grid_position) + Vector2(0.5,0.5)) * grid_size
	
	var random_direction: Vector2 = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized();
	var random_distance: float = randf_range(0, random_offset * grid_size)	
		
	moveable.position = world_position + random_direction * random_distance
