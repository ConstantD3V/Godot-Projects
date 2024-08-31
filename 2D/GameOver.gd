extends Control



func _on_TextureButton_pressed():
	pass
	get_tree().change_scene("res://level.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()
