extends Area2D
class_name CollectorComponent

@export var pickup_audio_stream: AudioStream

func _on_area_entered(area:Area2D) -> void:
	if area is ItemComponent:
		var item = area as ItemComponent;
		Inventory.add_item(item)
		play_pickup_sound()

func play_pickup_sound():
	if pickup_audio_stream:
		var audio_player = AudioStreamPlayer2D.new()
		audio_player.stream = pickup_audio_stream
		audio_player.global_position = global_position
		get_tree().current_scene.add_child(audio_player)
		audio_player.play()
		audio_player.finished.connect(audio_player.queue_free)

