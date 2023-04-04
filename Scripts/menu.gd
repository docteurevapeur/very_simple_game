extends CanvasLayer

var menu = false

signal close_menu
signal volume_scale(volume)
signal rotation_scale(volume)


func _process(delta):
	if Input.is_action_just_pressed("menu_close") and menu == true:
		emit_signal("close_menu")
		self.set_visible(false)
		menu = false


func _on_Volume_value_changed(value):
	emit_signal("volume_scale", value)


func _on_Player_open_menu():
	menu = true
	self.set_visible(true)


func _on_Button_pressed():
		emit_signal("close_menu")
		self.set_visible(false)
		menu = false


func _on_Rotation_value_changed(rotation_value):
	emit_signal("rotation_scale", rotation_value)
