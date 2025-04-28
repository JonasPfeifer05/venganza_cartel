extends CharacterBody2D

@export var player_speed := 4*16; 
@onready var sprite := $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	velocity = direction * player_speed;
	
	if direction.length() == 0:
		sprite.play("player_idle")
	elif direction.x > 0:
		sprite.play("player_walk_right")
	elif direction.x < 0:
		sprite.play("player_walk_left")
	elif direction.y < 0:
		sprite.play("player_walk_up")
	elif direction.y > 0:
		sprite.play("player_walk_down")

	move_and_slide()
