extends Control


func _ready():
	$Label.text = "GG, Thanks!!!!! Your final score was " + str(Global.score) + " points. "


func _on_Play_again_pressed():
	Global.reset()
	var _scene = get_tree().chagne_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()