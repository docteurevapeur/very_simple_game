extends Node2D

const MAX_SPEED = 300
const ACCELERATION = 90
const DECELERATION = 50
const FRICTION = 20

onready var particle = get_node("Sprite/ExhaustParticles")

var speed = 0
var angular_speed = (4 * PI) / 3
var screen_size
var velocity = Vector2.ZERO
var points = 0
var menu = false

signal point_signal(pointcount)
signal open_menu


func _ready():
	screen_size = get_viewport_rect().size


func particle_amount(speed_thing):
	if speed_thing >= 0:
		particle.lifetime = speed_thing / 300


func movement(delta):
	if Input.is_action_pressed("ui_up"):
		if speed <= MAX_SPEED:
			speed += ACCELERATION * delta
		elif speed >= MAX_SPEED:
			speed = MAX_SPEED
	elif Input.is_action_pressed("ui_down"):
		if speed >= -MAX_SPEED:
			speed -= DECELERATION * delta
		elif speed <= -MAX_SPEED:
			speed = -MAX_SPEED
	velocity = Vector2.UP.rotated(rotation) * speed
	if Input.is_action_pressed("ui_right"):
		rotation += angular_speed * delta
	if Input.is_action_pressed("ui_left"):
		rotation -= angular_speed * delta
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	particle_amount(speed)


func _process(delta):
	if Input.is_action_just_pressed("menu_open") and menu == false:
		emit_signal("open_menu")
		menu = true
	if !menu:
		movement(delta)


func _on_Coin_EnterSignal():
	points += 1
	emit_signal("point_signal", int(points))


func _on_Coin2_EnterSignal():
	points += 1
	emit_signal("point_signal", int(points))



func _on_Menu_close_menu():
	menu = false


func _on_BlackHole_BlackHoleTouch():
	points = 0
	emit_signal("point_signal", int(points))


func _on_Menu_rotation_scale(volume):
	angular_speed = (4 * PI * volume) / 300


func _on_Comet_CometTouch():
	points = 0
	emit_signal("point_signal", int(points))
