extends Area2D
class_name ItemComponent

@export var on_pickup_destroy_node: Node
@export var pickup_audio_stream: AudioStream
@export var item: Item
@export var amount: int


func _on_area_entered(_collector: CollectorComponent) -> void:
	play_pickup_sound()
	if on_pickup_destroy_node:
		on_pickup_destroy_node.queue_free()
		
func play_pickup_sound():
	var audio_player = AudioStreamPlayer2D.new()
	audio_player.stream = pickup_audio_stream
	audio_player.global_position = global_position
	get_tree().current_scene.add_child(audio_player)
	audio_player.play()
	audio_player.finished.connect(audio_player.queue_free)
