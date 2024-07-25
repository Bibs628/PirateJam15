class_name FireWeapon
extends Hitbox

@export var projectile_speed: int = 400
var direction: Vector2 = Vector2(0, 0)


func send_fireball(mouse, max_fireball_distance):
    position = Vector2(0, 0)
    position += mouse * projectile_speed