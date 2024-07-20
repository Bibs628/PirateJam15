extends Entity

# "Alchemistischer State; derzeit drei moegliche Formen. Es wird von der Standardform ausgegangen."
@export var alch_status = ["Normal", "Var 1", "Var 2"]

func _ready():
	print("Spieler spawned, ", health_points, " hp.")


func _process(_delta):
	var vector_position = position
	if vector_position.y > 1080:
		health_points = 0
	
	if vector_position.x < 0:
		vector_position.x = 0
		position = vector_position


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if health_points == 0:
		velocity = Vector2.ZERO
	else:
		move_and_slide()
		
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_velocity
		animation.play("Jump")

	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed
		animation.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		animation.play("Idle")


func _take_damage(dmg: int):
	print("Spieler bekam ", dmg, "Schaden. HP sind ", health_points, ".")
