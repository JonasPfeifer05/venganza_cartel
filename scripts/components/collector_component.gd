extends Area2D
class_name CollectorComponent

func _on_area_entered(area:Area2D) -> void:
	if area is ItemComponent:
		var item = area as ItemComponent;
		print("Collected item: " + str(item.item))
