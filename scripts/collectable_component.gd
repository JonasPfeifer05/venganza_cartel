extends Area2D
class_name CollectableComponent

signal entered_collectable(collectable: CollectableComponent)

@export var player: bool = false 
@onready var collectSound := $AudioStreamPlayer2D 

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass
	
func _on_area_entered(body):
	if body is CollectableComponent:
		var collectable = body as CollectableComponent
		entered_collectable.emit(collectable)	
		play_pickup_sound()
		
func play_pickup_sound():
	if collectSound:
		collectSound.volume_db=24
		collectSound.play()
