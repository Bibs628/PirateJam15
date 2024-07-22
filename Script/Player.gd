extends Entity
# Script fuer den Alchemisten.

@export_group("Elemente")
@export var current_element = element.FIRE
@export var element_speed = {
	element.FIRE: 400,
	element.PLANT: 500,
	element.WIND: 600,
	element.EARTH: 700,
}
@export var element_jump_velocity = {
	element.FIRE: -400,
	element.PLANT: -400,
	element.WIND: -400,
	element.EARTH: -4000
}

signal alchemist_status
signal alchemist_hp(hp: int)
signal alchemist_died

enum element {
		FIRE, 
		PLANT, 
		WIND,
		EARTH
}

func _init():
	print("Spieler spawned, %s hp." % [health_points])


func _process(_delta):
	if Input.is_action_just_pressed("Element Left"):
		change_element((current_element - 1 + element.size()) % element.size())
		
	if Input.is_action_just_pressed("Element Right"):
		change_element((current_element + 1 + element.size()) % element.size())


func _physics_process(delta):
	if position.x < 0: 
		position.x = 0
		
	if position.y > 1080:
		_take_damage(3)
		position.y = 1079
		
	if health_points <= 0: 
		velocity = Vector2.ZERO
	else: 
		move_and_slide()
		
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


func _take_damage(dmg: int):
	health_points -= dmg
	print("Spieler bekam ", dmg, " Schaden. HP sind ", health_points, ".")
	emit_signal("alchemist_hp")
	if health_points <= 0:
		visible = false
		emit_signal("alchemist_died")


func change_element(status: int):
	emit_signal("alchemist_status", status)
	current_element = status
	print("Element ist nun %s." % current_element)
	speed = element_speed[status]
	jump_velocity = element_jump_velocity[status]
