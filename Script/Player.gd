extends CharacterBody2D

@export_group("Eigenschaften")
@export var speed = 300.
@export var jump_velocity = -400.0
@export var health_points = 3;
# "Alchemistischer State; derzeit drei moegliche Formen. Es wird von der Standardform ausgegangen."
@export var alch_status = ["Normal", "Var 1", "Var 2"]
@export var animationen: NodePath

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animation: AnimationPlayer


func _ready():
	print("Spieler spawned, ", health_points, " hp.")
	animation = get_node(animationen)


func _process(_delta):
	var vector_position = position
	if vector_position.y > 1080:
		health_points = 0
	
	if health_points == 0:
		# TODO: Game Over state einfuegen
		pass

	if vector_position.x < 0:
		vector_position.x = 0
		position = vector_position

	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

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

	if health_points == 0:
		velocity = Vector2.ZERO
	else:
		move_and_slide()


func take_damage(dmg: int):
	health_points -= dmg
	animation.play("Defense")
	
	if health_points < 0:
		health_points = 0
	
	print("Spieler bekam ", dmg, "Schaden. HP sind ", health_points, ".")
	
	
func deal_damage():
	# TODO: Charakter uebt Schaden aus.
	animation.play("Attack")
