extends CharacterBody2D

@export var player_speed := 4*16; 
@export var sprite: AnimatedSprite2D

func _ready() -> void:
	pass
		
func _physics_process(_delta: float) -> void: 
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * player_speed;
	move_and_slide()
	
	sprite.flip_h = direction.x < 0;
	
	if direction.is_equal_approx(Vector2.ZERO):
		sprite.play("player_idle")
	elif direction.x > 0:
		sprite.play("player_walk_horizontal")
	elif direction.x < 0:
		sprite.play("player_walk_horizontal")
	elif direction.y < 0:
		sprite.play("player_walk_up")
	elif direction.y > 0:
		sprite.play("player_walk_down")


func _on_collectable_component_entered_collectable(collectable:CollectableComponent) -> void:
	print("Player touched: " + collectable.get_parent().name)
	collectable.play_pickup_sound()
