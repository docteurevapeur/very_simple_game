extends Node2D

signal CometTouch

const SPEED = 400

var rng = RandomNumberGenerator.new()
onready var side = 0
onready var value
var menu = false


func _ready():
	rng.randomize()
#	side = sign(rng.randf_range(-1, 1))
#	if side == 1:
	position.x = rng.randf_range(0, 600)


func _process(delta):
	if !menu:
		position.y += SPEED * delta

func _on_CometArea_area_entered(area):
	emit_signal("CometTouch")


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	rng.randomize()
	position.x = rng.randf_range(0, 600)
	position.y = 0


func _on_Player_open_menu():
	menu = true


func _on_Menu_close_menu():
	menu = false
