extends Entity
# Script fuer den Alchemisten.

signal alchemist_status
signal alchemist_hp(hp: int)
signal alchemist_died

enum alch_status {
		NORMAL, 
		VAR_1, 
		VAR_2
}

func _init():
	super._init("Spieler")
	print("Spieler spawned, %s hp." % health_points)


func _physics_process(delta):
	if position.x < 0: position.x = 0
		
	if position.y > 1080:
		_take_damage(3)
		position.y = 1079
		
	if health_points <= 0: velocity = Vector2.ZERO
	else: move_and_slide()
		
	if not is_on_floor(): velocity.y += gravity * delta
	
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


func change_alchemist(status: String):
	emit_signal("alchemist_status", status)
