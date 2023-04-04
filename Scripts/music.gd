extends AudioStreamPlayer


func _on_Menu_volume_scale(volume):
	if volume > 0:
		self.playing = true
		self.volume_db = (volume * .9) - 80
	else:
		self.playing = false
